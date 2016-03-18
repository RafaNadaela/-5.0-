//
//  SJXmpptool.m
//  xiangmu
//
//  Created by tarena on 16/1/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SJXmpptool.h"

#import "SJUserinfo.h"

@interface SJXmpptool ()<XMPPStreamDelegate>

{
    SJUserblock _block;

}

@end

@implementation SJXmpptool


singleton_implementation(SJXmpptool)




-(void)setxmppstream{
    
    
    self.xmppstream = [[XMPPStream alloc]init];
    //设置代理
    
    [self.xmppstream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    //给电子卡片  赋值
    
    self.vcardstore = [XMPPvCardCoreDataStorage sharedInstance];
    
    self.vcard = [[XMPPvCardTempModule alloc]initWithvCardStorage:self.vcardstore];
    
    self.avatar = [[XMPPvCardAvatarModule alloc]initWithvCardTempModule:self.vcard];
    
    
    //然后 就是 激活
    
    [self.vcard activate:self.xmppstream];
    
    [self.avatar activate:self.xmppstream];
    
}

-(void)connecthost{
    
    if (!self.xmppstream) {
        [self setxmppstream];
    }
    //链接服务器，设置属性 (就是要有一个用户名)
    
    self.xmppstream.hostName = SJXMPPHOSTNAME ;
    
    self.xmppstream.hostPort = SJXMPPPORT ;
    
    NSString* uname = nil ;
    
    if ([SJUserinfo sharedSJUserinfo].isreginster) {
        uname = [SJUserinfo sharedSJUserinfo].reginstername;
    }
    else{
        uname = [SJUserinfo sharedSJUserinfo].loginname;
    }
    
    //然后定义jid标识
    
    XMPPJID* jid = [XMPPJID jidWithUser:uname domain:SJXMPPDOMAIN resource:@"iphone"];
    
    self.xmppstream.myJID = jid ;
    
    
    //有了jid 还有链接一下
    
    NSError* error = nil ;
    
    //一切的一切，都是由xmppstream来做的
    [self.xmppstream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    
    if (error) {
        NSLog(@"%@",error);
    }
    
    
}

-(void)sendpassword{
    
    NSError* error = nil ;
    NSString* password = nil ;
    
    if ([SJUserinfo sharedSJUserinfo].isreginster) {
        
        password = [SJUserinfo sharedSJUserinfo].reginsterpassword;
        
        //发送密码，是为了 拿到授权
        
        [self.xmppstream authenticateWithPassword:password error:&error];
        
    }else{
        
        password = [SJUserinfo sharedSJUserinfo].lopginpassword ;
        
        [self.xmppstream authenticateWithPassword:password error:&error];
        
    }
    
    
    
    
    
    if (error) {
        NSLog(@"%@",error);
    }
    
    
}

//如果 发送密码，服务器给用户授权成功，那么，就要发送在线消息

-(void)sendmessage{
    
    //发送消息
    
    XMPPPresence* present = [XMPPPresence presence];
    
    [self.xmppstream sendElement:present];
    
}
#pragma mark - delegate
//还有 两个协议方法（就是注册的）

-(void)xmppStreamDidRegister:(XMPPStream *)sender{
    //注册成功，
    
    //通过block 把值传过去
    
    if (_block) {
        
        _block(SJReginstersuccessful);
    }
    
    
    
}

-(void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error{
    
    if (_block && error) {
        
        _block(SJRegiinsterfailed);
    }
    
    NSLog(@"%@",error);
    
    
}


//链接服务器成功后 ，发送密码，实现协议方法
//协议实现
-(void)xmppStreamDidConnect:(XMPPStream *)sender{
    

    
    NSLog(@"lianjie chengg");
    
    [self sendpassword];
    
}


//还有一个就是服务器没有链接成功

-(void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error{
    
    if (_block && error) {
        _block(SJLoginfailed);
    }
    
    
    
    //没有链接成功 ，直接打印一个错误，
    NSLog(@"%@",error);
    
    
}

-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender{
    
    if (_block) {
        _block(SJLoginsuccess);
    }
    //协议方法，就是授权成功后，发送在线消息
    
    [self sendmessage];
    
}


-(void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error{
    
    if (_block && error) {
        _block(SJLoginfailed);
    }
    
    
    //授权失败后，直接打印，一个错误即可
    NSLog(@"%@",error);
    
    NSLog(@"......................");
    
    
}




//对于上面的所有方法，直接写一个总的
//让用户直接调用即可

-(void)userloginmethod:(SJUserblock)block{
    
    
    _block = block ;
    [self.xmppstream disconnect];
    
    [self connecthost];
    
}



//对于注册的，也有一个直接写的方法

-(void)userreginstermethod:(SJUserblock)block
{
    
    _block = block ;
    
    [self.xmppstream disconnect];
    
    [self connecthost];
    
}



@end

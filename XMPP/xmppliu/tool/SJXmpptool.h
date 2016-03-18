//
//  SJXmpptool.h
//  xiangmu
//
//  Created by tarena on 16/1/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMPPFramework.h"

#import "Singleton.h"

//定义一个枚举
typedef enum
{
    SJReginstersuccessful,
    SJRegiinsterfailed,
    SJLoginsuccess,
    SJLoginfailed,
    SJReginsterneterror
    
    
}SJReginsterType;

//然后在定义一个block

typedef void(^SJUserblock)(SJReginsterType type);


@interface SJXmpptool : NSObject

//信息交流，都是用stream来实现的。

@property(nonatomic,strong)XMPPStream* xmppstream;




//声明电子卡片 和 存储的 属性   声明完了之后，就要在 .m文件中  赋值 然后 激活


@property(nonatomic,strong)XMPPvCardTempModule* vcard;

@property(nonatomic,strong)XMPPvCardAvatarModule* avatar;

@property(nonatomic,strong)XMPPvCardCoreDataStorage* vcardstore;









//

-(void)setxmppstream;

-(void)connecthost;

-(void)sendpassword;

-(void)sendmessage;



//既然要把状态传给主控制器，所以要有一个传参，就是传 block

-(void)userloginmethod:(SJUserblock)block;

-(void)userreginstermethod:(SJUserblock)block;

singleton_interface(SJXmpptool)


@end

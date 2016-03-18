//
//  TRReginsterViewController.m
//  xiangmu
//
//  Created by tarena on 16/1/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRReginsterViewController.h"
#import "SJUserinfo.h"

#import "SJXmpptool.h"

#import "AFNetworking.h"

@interface TRReginsterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernametextfield;


@property (weak, nonatomic) IBOutlet UITextField *passwordtext;



@end

@implementation TRReginsterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIImageView* image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
    
    image.frame = CGRectMake(0, 0, 30, 30);
    
    image.contentMode = UIViewContentModeCenter;
    
    self.usernametextfield.leftViewMode = UITextFieldViewModeAlways;
    
    self.usernametextfield.leftView = image ;
    
    
    UIImageView* imagepassword = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lock"]];
    
    imagepassword.frame = CGRectMake(5, 5, 30, 30);
    
    imagepassword.contentMode = UIViewContentModeCenter ;
    
    self.passwordtext.leftViewMode = UITextFieldViewModeAlways ;
    
    self.passwordtext.leftView = imagepassword ;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    
    self.navigationItem.title = @"注册";

    
    
    
    
}
-(void)goback{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


- (IBAction)reginsterbtn:(id)sender {
    
    //其实这里有最主要的一步就是 ，判断是否是 注册类型
    
    [SJUserinfo sharedSJUserinfo].reginster = YES ;
    
    
    //对于注册，首先第一步，就是要把，在文本中输入的值保存起来
    
    //有了注册的用户名和密码，就可以进行注册
    
    [SJUserinfo sharedSJUserinfo].reginstername = self.usernametextfield.text ;
    
    [SJUserinfo sharedSJUserinfo].reginsterpassword = self.passwordtext.text ;
    
    __weak typeof(self) vc = self ;
    
    [[SJXmpptool sharedSJXmpptool]userreginstermethod:^(SJReginsterType type) {
        
        [vc panduanzhuangtai:type];
        
    }];

}


-(void)panduanzhuangtai:(SJReginsterType)type{
    
    switch (type) {
            
        case SJReginstersuccessful:
            
        {
            //如果注册成功，还有发送web请求
            
            [self webreginster];
            
            // TRLoginViewController* vc = [[TRLoginViewController alloc]init];
            
            // UINavigationController* avc = [[UINavigationController alloc]initWithRootViewController:vc];
            
            // [self presentViewController:avc animated:YES completion:nil];
            
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
            NSLog(@"......");
            
            
            
        }
            
            break;
            
        case SJRegiinsterfailed:
            
            NSLog(@"注册失败");
            
            //无论注册成功与否，都要跳到登录界面
            break;
            
        case SJReginsterneterror:
            
            NSLog(@"网络错误");
            
            
            break;
            
    }
}


//web注册

-(void)webreginster{
    
    //web注册 ，其实实质就是把 注册的账号与密码 ，存到web服务器上
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *url = [NSString stringWithFormat:@"http://%@:8080/allRunServer/register.jsp",SJXMPPHOSTNAME];
    
    
    NSMutableDictionary *paramaters = [NSMutableDictionary dictionary];
    
    paramaters[@"username"] = [SJUserinfo sharedSJUserinfo].reginstername;
    
    paramaters[@"md5password"] = [SJUserinfo sharedSJUserinfo].reginsterpassword;
    
    paramaters[@"nickname"] = [SJUserinfo sharedSJUserinfo].reginstername;
    
    [manager POST:url parameters:paramaters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
#warning 发送web注册 ，必须是要有 图像的， 这个方法 就是把 图像给上传上去的一种方法
        
        UIImage *headImage = [UIImage imageNamed:@"IMG_2308"];
        
        NSData *data = UIImagePNGRepresentation(headImage);
        
        [formData appendPartWithFileData:data name:@"pic" fileName:@"headImage.png" mimeType:@"image/jpeg"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}


@end

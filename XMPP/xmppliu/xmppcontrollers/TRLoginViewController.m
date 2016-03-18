//
//  TRLoginViewController.m
//  xiangmu
//
//  Created by tarena on 16/1/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRLoginViewController.h"
#import "SJXmpptool.h"
#import "SJUserinfo.h"

#import "XMPPvCardTemp.h"

#import "ViewController.h"


@interface TRLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *userpassword;



@end

@implementation TRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView* image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
    
    image1.frame = CGRectMake(0, 0, 30, 30);
    
    image1.contentMode = UIViewContentModeCenter ;
    
    self.username.leftViewMode = UITextFieldViewModeAlways ;
    
    self.username.leftView = image1 ;
    
    
    
    
    UIImageView* image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lock"]];
    
    image2.frame = CGRectMake(0, 0, 30, 30);
    
    image2.contentMode = UIViewContentModeCenter ;
    
    self.userpassword.leftViewMode = UITextFieldViewModeAlways ;
    
    self.userpassword.leftView = image2 ;

    
    
    
    
    
    
    
    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
 }

-(void)goback{

    [self dismissViewControllerAnimated:YES completion:nil];


}

- (IBAction)loginbtn:(id)sender {
    
    [SJUserinfo sharedSJUserinfo].reginster = NO ;
    
    [SJUserinfo sharedSJUserinfo].loginname = self.username.text ;
    
    [SJUserinfo sharedSJUserinfo].lopginpassword = self.userpassword.text ;
    
    __weak typeof(self) vc = self ;
    
    [[SJXmpptool sharedSJXmpptool] userloginmethod:^(SJReginsterType type) {
        
        [vc handlelogin:type];
        
     
        
    }];
    
    

}



-(void)handlelogin:(SJReginsterType)type{
    
    switch (type) {
        case  SJLoginsuccess :
            
        {
            ViewController* vc = [[ViewController alloc]init];
            
            UINavigationController* avc = [[UINavigationController alloc]initWithRootViewController:vc];
            
            [self presentViewController:avc animated:YES completion:nil];
            
        }
            break;
            
        case SJLoginfailed:
            NSLog(@"登录失败");
            
            break;
    }
}











@end

//
//  ViewController.m
//  xiangmu
//
//  Created by tarena on 16/1/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ViewController.h"

#import "XMPPvCardTemp.h"

#import "SJXmpptool.h"
#import "SJUserinfo.h"

#import "TRxiugaiViewController.h"

#import "UIImageView+yuanjiaoimageview.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *uiimageview;

@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *nickname;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    
}

-(void)goback{

    [self dismissViewControllerAnimated:YES completion:nil];


}



-(void)viewWillAppear:(BOOL)animated{


    [super viewWillAppear:animated];
    
    
    XMPPvCardTemp* temp = [SJXmpptool sharedSJXmpptool].vcard.myvCardTemp ;
    
    if (temp.photo) {
        
        self.uiimageview.image = [UIImage imageWithData:temp.photo];
        
    }else{
    
        self.uiimageview.image = [UIImage imageNamed:@"recogniz_cd@2x.png"];
    
    }

    self.username.text = [SJUserinfo sharedSJUserinfo].loginname ;
    
    self.nickname.text = temp.nickname ;
    
    
    //直接在这里面调用设置图片圆角的公式即可，（在分类里面写的）
    [self.uiimageview tupianyuanjiaoshezhi];
    
   

}


- (IBAction)gerenshezhibtn:(id)sender {
    
    //点击然后推出 修改界面
    
    TRxiugaiViewController* vc = [[TRxiugaiViewController alloc]init];
    
    XMPPvCardTemp* cardtemp = [SJXmpptool sharedSJXmpptool].vcard.myvCardTemp ;
    
    vc.uservcardtemp = cardtemp ;
    
    UINavigationController* avc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:avc animated:YES completion:nil];
    
    
    
    
}







@end

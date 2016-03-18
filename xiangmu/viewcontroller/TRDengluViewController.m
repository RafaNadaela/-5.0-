//
//  TRDengluViewController.m
//  xiangmu
//
//  Created by tarena on 16/1/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRDengluViewController.h"

#import "TRHCTableViewController.h"

#import "TRReginsterViewController.h"

#import "TRLoginViewController.h"

#import "XMPPvCardTemp.h"

#import "SJUserinfo.h"
#import "SJXmpptool.h"

@interface TRDengluViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernamelabel;

@property (weak, nonatomic) IBOutlet UIImageView *userimagename;


@property (weak, nonatomic) IBOutlet UILabel *username;



@end

@implementation TRDengluViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"消息选中@3x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    
    
    
    
 }



-(void)goback{

    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)shoucangbutton:(id)sender {
    
    TRLoginViewController* vc = [[TRLoginViewController alloc]init];
    
    UINavigationController* avc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:avc animated:YES completion:nil];
    
    
}


- (IBAction)pinglunbutton:(id)sender {
    
    TRReginsterViewController* vc = [[TRReginsterViewController alloc]init];
    
    UINavigationController* avc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:avc animated:YES completion:nil];
    
}



- (IBAction)huancunbutton:(id)sender {
    
    TRHCTableViewController* VC =[[TRHCTableViewController alloc]init];
    
    VC.vlistarra = self.voidelarray;
    
    
    UINavigationController* avc = [[UINavigationController alloc]initWithRootViewController:VC];
    
    [self presentViewController:avc animated:YES completion:nil];
    
}


@end

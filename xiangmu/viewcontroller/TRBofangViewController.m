//
//  TRBofangViewController.m
//  xiangmu
//
//  Created by tarena on 15/12/27.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRBofangViewController.h"
#import "UIImageView+WebCache.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "UMSocialSnsService.h"
#import <MediaPlayer/MediaPlayer.h>
#import "AppDelegate.h"
#import "UMSocialControllerService.h"
#import <Foundation/Foundation.h>
//#import <Foundation/Foundation.h>

#import "UMSocialSnsPlatformManager.h"

@interface TRBofangViewController ()<NSURLSessionDownloadDelegate,UMSocialUIDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@property (weak, nonatomic) IBOutlet UILabel *categorylabel;

@property (weak, nonatomic) IBOutlet UILabel *durationlabel;


@property (weak, nonatomic) IBOutlet UILabel *xiangqinglabel;

@property (weak, nonatomic) IBOutlet UILabel *collectionlabel;


@property (weak, nonatomic) IBOutlet UILabel *sharedcount;


@property (weak, nonatomic) IBOutlet UILabel *playcount;


@property (weak, nonatomic) IBOutlet UILabel *replycount;

@property(nonatomic,strong)AVPlayer* player;



@end

@implementation TRBofangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* strpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    NSString* zongpath = [strpath stringByAppendingPathComponent:[self.imagestr lastPathComponent]];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:zongpath]) {
        
        self.playcount.text = @"已加载";

    }
    
    UIBarButtonItem* back = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goback11)];
    
    self.navigationItem.leftBarButtonItem = back;
    
    self.navigationItem.title = @"Vision";
    
    
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:self.strimage] placeholderImage:[UIImage imageNamed:@""]];
    self.titlelabel.text = self.title11;
    self.categorylabel.text = self.category;
    self.xiangqinglabel.text = self.xiangqing;
    self.durationlabel.text = self.duration.description;
    
    self.collectionlabel.text = self.kk.description;
    
    self.sharedcount.text = self.kk1.description;
    
    //self.playcount.text = @"缓存";
    
    self.replycount.text = self.kk3.description;
    
    
}

-(void)goback11
{
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)playbutton:(id)sender {
    
    
    NSString* strpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    NSString* zongpath = [strpath stringByAppendingPathComponent:[self.imagestr lastPathComponent]];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:zongpath]) {
        
        self.playcount.text = @"已加载";
        
        AVPlayer* player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:zongpath]];
        
               AVPlayerViewController* playercontroller = [AVPlayerViewController new];
                
               playercontroller.player = player;
        
                
              [self presentViewController:playercontroller animated:YES completion:nil];
        
    }
    else
    {
    
    AVPlayerViewController* vc = [AVPlayerViewController new];
    
    
    vc.player = [AVPlayer playerWithURL:[NSURL URLWithString:self.imagestr]];
    
    [self presentViewController:vc animated:YES completion:nil];
    }

}


- (IBAction)lovebutton:(UIButton*)sender {
    
    self.collectionlabel.text = [NSString stringWithFormat:@"%d",[self.kk intValue] + 1];
    
    

}

- (IBAction)sharedbutton:(id)sender {
    
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.strimage]];
    
    UIImage* image = [UIImage imageWithData:data];
    
    NSString* str = self.imagestr ;
    
    NSString *shareText = [NSString stringWithFormat:@"%@ ,%@" ,self.title11 , self.imagestr ];
    
    //分享内嵌文字
     //   UIImage *shareImage = [UIImage imageNamed:@"UMS_social_demo"];          //分享内嵌图片
   // UIImage *shareImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"UMS_social_demo" ofType:@"png"]];
    //UIImage* shareimage = [UIImage imageNamed:self.strimage];
        
    //调用快速分享接口

    
//    [UMSocialSnsService presentSnsController:self appKey:@"56e4cca1e0f55afcf60016e9" shareText:shareText shareImage:image shareToSnsNames:@[UMShareToSina , UMShareToTencent,UMShareToRenren,UMShareToDouban,UMShareToQzone,UMShareToEmail] delegate:self];
    
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"56e4cca1e0f55afcf60016e9" shareText:shareText shareImage:image shareToSnsNames:@[UMShareToSina , UMShareToTencent,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToRenren,UMShareToDouban,UMShareToQzone,UMShareToEmail] delegate:self];
    
    
    
    [UMSocialData defaultData].extConfig.qqData.url = self.imagestr;
    
    [UMSocialData defaultData].extConfig.qzoneData.url = self.imagestr ;
    [UMSocialData defaultData].extConfig.wechatSessionData.url = self.imagestr ;
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = self.imagestr ;
    
    
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeImage;
//    
//    纯图片分享类型没有文字，点击图片可以查看大图
//    
//    纯文字分享类型方法为
    
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeText;
    
//    纯文字分享类型没有图片，点击不会跳转
//    
//    应用分享类型方法
    
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeApp;

    
    
    
    
    //    AppDelegate* app = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    
//    app.str = self.imagestr ;
    
    
}




- (IBAction)downloadbutton:(UIButton*)sender {
    
    if ([self.playcount.text  isEqual: @"已加载"]) {
        sender.enabled = NO ;
        
        
        
    }else
    {
    
    NSString* strurl = self.imagestr ;
    
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:strurl]];
    
    NSURLSessionConfiguration* congi = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession* session = [NSURLSession sessionWithConfiguration:congi delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask* task = [session downloadTaskWithRequest:request];
    
    [task resume];
        
    }
    
}

- (IBAction)pinglunbutton:(id)sender {
   //推出下一个界面
    
}

//下载完毕时
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{

    NSString* strpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
   // NSString* str = @"user/tarena";
    //这一个 实现的 功能就是，把不同的视频都下载下来，不会覆盖
    NSString* zongpath = [strpath stringByAppendingPathComponent:[self.imagestr lastPathComponent]];
    
    NSURL* url = location;
    
    NSString* str11 = [url absoluteString];

    if (![[NSFileManager defaultManager]fileExistsAtPath:zongpath]) {
    
        NSData* data = [[NSData alloc]initWithContentsOfURL:location];
        
        [data writeToFile:zongpath atomically:YES];
     }
    else
     {
         NSLog(@"1234");
     }
    NSLog(@"%@",zongpath);
    NSLog(@"%@",str11);
    
    
        
        self.playcount.text = @"已加载";
        
        NSLog(@"%@",self.playcount.text);
   


}
//下载进程
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    
    self.playcount.text = [NSString stringWithFormat:@"%.2f%%",totalBytesWritten * 1.0 / totalBytesExpectedToWrite] ;
    
    
    
    
}


@end

//
//  TRHCTableViewController.m
//  xiangmu
//
//  Created by tarena on 16/1/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRHCTableViewController.h"

#import "TRTableViewCell.h"

#import "TRVideoList.h"

#import <AVKit/AVKit.h>

#import <AVFoundation/AVFoundation.h>

@interface TRHCTableViewController ()
@property(nonatomic,strong)NSMutableArray* mutablearray;
@property(nonatomic,strong)NSArray* lastarray;
@end

@implementation TRHCTableViewController

- (NSMutableArray *)mutablearray {
    if(_mutablearray == nil) {
        _mutablearray = [[NSMutableArray alloc] init];
        
        NSString* strpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSLog(@"%@",strpath);
#warning 找到 这个文件 路径下 存有的 所有的 内容 ，用数组来接收
        self.lastarray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:strpath error:nil];
        
        for (TRVideoList* listvv in self.vlistarra) {
            
            NSString* strbijiao =  [listvv.playUrl lastPathComponent] ;
//判断这个 数组中是否存有 这些 内容
            if ([self.lastarray containsObject:strbijiao]) {
 //这个可变的 数组中存的是 ，一个一个的 trvideolist 类型的。
                [_mutablearray addObject:listvv];
            }
        }
    }
    return _mutablearray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TRTableViewCell" bundle:nil] forCellReuseIdentifier:@"kk"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"个人选中2@3x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
//在viewdidload中 刷新界面。把已经下载的刷新到,tableview中
   // [self.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    [self.tableView reloadData];

}
-(void)goback{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.mutablearray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kk" forIndexPath:indexPath];
//因为在这个 定义的可变数组中存的是 一个一个的 trvideolist 类型的 。
    TRVideoList* list11 = self.mutablearray[indexPath.row];
    
    cell.list = list11;
    
    
   
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;

}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TRVideoList* vlist = self.mutablearray[indexPath.row];
    
    NSString* strpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString* zongpath = [strpath stringByAppendingPathComponent:[vlist.playUrl lastPathComponent]];
    
    
        AVPlayer* player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:zongpath]];
        
        AVPlayerViewController* playercontroller = [AVPlayerViewController new];
        
        playercontroller.player = player;
        
        
        [self presentViewController:playercontroller animated:YES completion:nil];
 
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    return YES ;

}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    TRVideoList* vlist = self.mutablearray[indexPath.row];
    
    NSString* strpath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString* zongpath = [strpath stringByAppendingPathComponent:[vlist.playUrl lastPathComponent]];
    
//要删除 总共要删除三部分
    [[NSFileManager defaultManager] removeItemAtPath:zongpath error:nil];
    
    [self.mutablearray removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    [tableView reloadData];
    
    
    

}


@end

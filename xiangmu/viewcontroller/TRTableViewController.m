//
//  TRTableViewController.m
//  xiangmu
//
//  Created by tarena on 16/1/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRTableViewController.h"

#import "TRVideoList.h"

#import "TRManager.h"
//要有get解析 首先要有一个 头文件

#import "AFNetworking.h"

#import "TRTableViewCell.h"

#import "UIImageView+WebCache.h"

#import "TRBofangViewController.h"

@interface TRTableViewController ()

//定义一个 数组 来存储解析后 返回来的 值（里面存的是一个一个的 trvideolist 类型的）


@property(nonatomic,strong)NSArray* videoarray ;

@end

@implementation TRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = self.titlestr ;
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TRTableViewCell" bundle:nil] forCellReuseIdentifier:@"kk"];
    
    [self getjison];
    
    
    
}

-(void)goback{

    [self dismissViewControllerAnimated:YES completion:nil];

}


-(void)getjison{

    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    
    self.jisonstr = [self.jisonstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager GET:self.jisonstr parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            //这一个是解析成功后的内容
            
            self.videoarray = [TRManager getvideolist11:responseObject];
            
            [self.tableView reloadData];

        }
         
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        
    }];


}




#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return self.videoarray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kk"];
    
    TRVideoList* vlist = self.videoarray[indexPath.row];
    
    cell.list = vlist ;
   
   
    
    
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 170;

}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TRBofangViewController* bvc = [[TRBofangViewController alloc]initWithNibName:@"TRBofangViewController" bundle:nil];
    
    TRVideoList* list = self.videoarray[indexPath.row];
    
    bvc.strimage = list.coverForFeed;
    bvc.title11 = list.title;
    
    bvc.category = list.category;
    bvc.xiangqing = list.desc;
    
    bvc.duration = list.duration;
    
    bvc.imagestr = list.playUrl;
    
    //bvc.dic = list.consumption;
    
    bvc.kk = list.collectionCount;
    
    bvc.kk1 = list.shareCount;
    
    bvc.kk2 = list.playCount;
    
    bvc.kk3 = list.replyCount;
    
    UINavigationController* avc = [[UINavigationController alloc]initWithRootViewController:bvc];
    
    [self presentViewController:avc animated:YES completion:nil];




}
















@end

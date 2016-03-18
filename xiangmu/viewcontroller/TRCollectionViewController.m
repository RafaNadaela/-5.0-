//
//  TRCollectionViewController.m
//  xiangmu
//
//  Created by tarena on 15/12/27.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRCollectionViewController.h"

#import "TRMainCollectionViewCell.h"

#import "TRManager.h"
#import "TRDailyList.h"
#import "TRVideoList.h"

#import "AFNetworking.h"
#import "TRBofangViewController.h"

#import "TRDengluViewController.h"

@interface TRCollectionViewController ()
@property(nonatomic,strong)NSArray* dailyarray;

@property(nonatomic,strong)NSArray* voildarray;
@end

@implementation TRCollectionViewController

static NSString * const reuseIdentifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.collectionView registerNib:[UINib nibWithNibName:@"TRMainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    
      
    UIBarButtonItem* item1 = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"个人选中2@3x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(clickxiangying)];
    
    UIBarButtonItem* item2 = [[UIBarButtonItem alloc]initWithTitle:@"today" style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.leftBarButtonItems = @[item1 ,item2];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:nil];
    
    
    self.navigationItem.title = @"vision";
    
    
    [self setrequest];
    
   
}

-(void)clickxiangying
{
     //点击按钮推出登录界面
    
    TRDengluViewController* vc = [[TRDengluViewController alloc]init];
    
    vc.voidelarray = self.voildarray;
    
    UINavigationController* avc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:avc animated:YES completion:nil];
    
}

-(void)setrequest{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    
    NSString* strurl = @"http://baobab.wandoujia.com/api/v1/feed?num=100&vc=166&u=e31a2548e609e642b6f394e8bc1454f33c2bf565&v=1.9.1&f=iphone";
    
    [manager GET:strurl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            self.dailyarray = [TRManager getdailylist:responseObject];
            
            
            self.voildarray = [TRManager getvideolist:responseObject];
            
            [self.collectionView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        
    }];
}
#pragma mark <UICollectionViewDataSource>



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
        return self.voildarray.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TRMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
   
        cell.videolist = self.voildarray[indexPath.row];
        
        return cell;

    

}

//在这里 设置成 分组类型的 ，试一下

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   TRVideoList* list = self.voildarray[indexPath.row];
    
    
    
    TRBofangViewController* bvc = [[TRBofangViewController alloc]initWithNibName:@"TRBofangViewController" bundle:nil];
    
    
    
    
   // TRVideoList* list = self.videoarray[indexPath.row];
    
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    
//    bvc.strimage = list.coverForFeed;
//    bvc.title11 = list.title;
//    
//    bvc.category = list.category;
//    bvc.xiangqing = list.desc;
//    
//    bvc.duration = list.duration;
//    
//    bvc.imagestr = list.playUrl;
//    
//    //bvc.dic = list.consumption;
//    
//    bvc.kk = list.collectionCount;
//    
//    bvc.kk1 = list.shareCount;
//    
//    bvc.kk2 = list.playCount;
//    
//    bvc.kk3 = list.replyCount;
    
    UINavigationController* avi = [[UINavigationController alloc]initWithRootViewController:bvc];
    
    [self presentViewController:avi animated:YES completion:nil];
    
  }


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGSize size = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height*0.3);
    
    return size;
    
    
}




@end

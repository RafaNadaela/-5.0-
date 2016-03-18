//
//  TRMainCollectionViewController.m
//  xiangmu
//
//  Created by tarena on 15/12/24.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRMainCollectionViewController.h"

#import "TRCustomCollectionViewCell.h"

#import "TRManager.h"
#import "TRSecondshuju.h"
#import "AFNetworking.h"

#import "TRTableViewController.h"



@interface TRMainCollectionViewController ()

@property(nonatomic,strong)NSArray* secondarray;

@end

@implementation TRMainCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"TRCustomCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];

    [self setsecondshuji];
}


-(void)setsecondshuji
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    
    NSString* urlstr = @"http://baobab.wandoujia.com/api/v1/categories?vc=166&u=e31a2548e609e642b6f394e8bc1454f33c2bf565&v=1.9.1&f=iphone";
    
    [manager GET:urlstr parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            
            self.secondarray = [TRManager getsecondshuju:responseObject];
            
            [self.collectionView reloadData];
            
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    }];
}
#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    
    return self.secondarray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TRCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.secondshuju = self.secondarray[indexPath.row];
    
    
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    CGSize size = CGSizeMake(self.view.bounds.size.width*0.48, self.view.bounds.size.height*0.3);
    
    return size;


}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    TRTableViewController* vc = [[TRTableViewController alloc]init];
    
    TRSecondshuju* second = self.secondarray[indexPath.row];
    
    NSString* strurl = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/videos?num=1000&categoryName=%@&strategy=date&vc=166&t=2&u=e738c7d25316301b4b7358dbb1ed9cc637afed8e&net=wifi&v=1.9.1&f=iphone",second.name];
    
    vc.jisonstr = strurl;
    
    vc.titlestr = second.name ;
    
    UINavigationController* avc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:avc animated:YES completion:nil];


}






@end

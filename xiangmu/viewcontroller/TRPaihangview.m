//
//  TRPaihangview.m
//  xiangmu
//
//  Created by tarena on 16/1/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRPaihangview.h"
#import "Masonry.h"

#import "TRTableViewCell.h"
#import "AFNetworking.h"
#import "TRManager.h"
#import "TRVideoList.h"
#import "TRBofangViewController.h"


@interface TRPaihangview ()<UITableViewDelegate,UITableViewDataSource>

//首先先要定义一个 tableview

@property(nonatomic,strong)UITableView* tableview;


//定义一个 数组 来存储数据

@property(nonatomic,strong)NSArray* vodeolistarray;


@property (weak, nonatomic) IBOutlet UIButton *currentbtn;



@property(nonatomic,strong)UIButton* prebtn ;

@end

@implementation TRPaihangview

- (UITableView *)tableview {
    if(_tableview == nil) {
        _tableview = [[UITableView alloc] init];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerNib:[UINib nibWithNibName:@"TRTableViewCell" bundle:nil] forCellReuseIdentifier:@"kk"];
        
        
        [self.view addSubview:_tableview];
        
        [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(110);
            make.left.right.bottom.mas_equalTo(0);
            
        }];
        
    }
    return _tableview;
}
//在这里面写一个 默认的，就是初始化的
-(void)viewDidLoad{
    
    [super viewDidLoad];
    
   // self.currentbtn.selected = YES ;
    
    self.tableview.hidden = NO ;
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    
    NSString* monthurl = @"http://baobab.wandoujia.com/api/v1/ranklist?strategy=weekly&vc=166&u=e738c7d25316301b4b7358dbb1ed9cc637afed8e&v=1.9.1&f=iphone";
    
    [manager GET:monthurl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            self.vodeolistarray = [TRManager getvideolist11:responseObject];
            
            [self.tableview reloadData];
            
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        NSLog(@"...........");
    }];
    
}


-(void)setbackground:(NSString*)str{


    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    
    NSString* monthurl = [NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/ranklist?strategy=%@&vc=166&u=e738c7d25316301b4b7358dbb1ed9cc637afed8e&v=1.9.1&f=iphone",str];
    
    [manager GET:monthurl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            self.vodeolistarray = [TRManager getvideolist11:responseObject];
            
            [self.tableview reloadData];
            
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        NSLog(@"...........");
    }];



}


#pragma mark - delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.vodeolistarray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TRTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"kk" forIndexPath:indexPath];
    
    TRVideoList* list11 = self.vodeolistarray[indexPath.row];
    
    cell.list = list11 ;
    
    return cell ;
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 180;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TRVideoList* list = self.vodeolistarray[indexPath.row];
    
    
    TRBofangViewController* bvc = [[TRBofangViewController alloc]init];
    
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





- (IBAction)btn1234:(UIButton*)sender {
    
//    if (self.prebtn == self.currentbtn) {
//        return;
//    }
    self.currentbtn = sender ;
    
    self.currentbtn.selected = YES ;
    
    self.prebtn.selected = NO ;
    
    self.prebtn = self.currentbtn ;
    
    NSString* str = nil ;
    if (sender.tag == 0) {
        
        str = @"weekly";
        
    }if (sender.tag == 1) {
        
        str = @"monthly";
    }if (sender.tag == 2) {
        
        str = @"historical";
    }
    
    [self setbackground:str];
    
    
    
}
















@end

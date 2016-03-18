//
//  TRTableViewController.h
//  xiangmu
//
//  Created by tarena on 16/1/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRTableViewController : UITableViewController


//公开一个 公共的 字符串属性 ，来接收 其他控制器 传过来的值

@property(nonatomic,strong)NSString* jisonstr;



@property(nonatomic,strong)NSString* titlestr;

@end

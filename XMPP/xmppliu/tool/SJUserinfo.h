//
//  SJUserinfo.h
//  xiangmu
//
//  Created by tarena on 16/1/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface SJUserinfo : NSObject

@property(nonatomic,copy)NSString* loginname;

@property(nonatomic,copy)NSString* lopginpassword;


@property(nonatomic,strong)NSString* reginstername;

@property(nonatomic,strong)NSString* reginsterpassword;

@property(nonatomic,assign,getter=isreginster)BOOL reginster;

singleton_interface(SJUserinfo)

@end

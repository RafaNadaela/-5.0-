//
//  TRVideoList.h
//  xiangmu
//
//  Created by tarena on 15/12/26.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRVideoList : NSObject

@property(nonatomic,strong)NSString* title;
@property(nonatomic,strong)NSString* desc;

@property(nonatomic,strong)NSString* category;

@property(nonatomic,strong)NSNumber* duration;

@property(nonatomic,strong)NSDictionary* consumption;






@property(nonatomic,strong)NSNumber* collectionCount;

@property(nonatomic,strong)NSNumber* shareCount;

@property(nonatomic,strong)NSNumber* playCount;

@property(nonatomic,strong)NSNumber* replyCount;




@property(nonatomic,strong)NSString* coverForFeed;

@property(nonatomic,strong)NSString* coverForDetail;

@property(nonatomic,strong)NSString* playUrl;

+(id)setparseviodel:(NSDictionary*)dic;




+(id)setlistmodel:(NSDictionary*)dic;



@end

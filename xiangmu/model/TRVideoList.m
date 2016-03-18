//
//  TRVideoList.m
//  xiangmu
//
//  Created by tarena on 15/12/26.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRVideoList.h"

@implementation TRVideoList

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"description"]) {
        
        self.desc = value;
        
    }


}

+(id)setparseviodel:(NSDictionary *)dic
{

    return [[self alloc]initWithjiexi:(NSDictionary*)dic];


}


-(id)initWithjiexi:(NSDictionary*)dic
{

    if (self = [super init]) {
        
        self.title = dic[@"title"];
        self.desc = dic[@"description"];
        self.category = dic[@"category"];
        self.duration = dic[@"duration"];
        self.coverForFeed = dic[@"coverForFeed"];
        self.coverForDetail = dic[@"coverForDetail"];
        self.playUrl = dic[@"playUrl"];
        
        self.collectionCount = dic[@"consumption"][@"collectionCount"];
        self.shareCount = dic[@"consumption"][@"shareCount"];
        self.playCount = dic[@"consumption"][@"playCount"];
        self.replyCount = dic[@"consumption"][@"replyCount"];
        
        
        
    }

    return self;


}




+(id)setlistmodel:(NSDictionary *)dic{

    return [[self alloc]initWithmodeljiexi:(NSDictionary*)dic];


}

-(id)initWithmodeljiexi:(NSDictionary*)dic{
    if (self = [super init]) {
        
        self.title = dic[@"title"];
        self.desc = dic[@"description"];
        self.category = dic[@"category"];
        self.duration = dic[@"duration"];
        self.coverForFeed = dic[@"coverForFeed"];
        self.coverForDetail = dic[@"coverForDetail"];
        self.playUrl = dic[@"playUrl"];
        
        self.collectionCount = dic[@"consumption"][@"collectionCount"];
        self.shareCount = dic[@"consumption"][@"shareCount"];
        self.playCount = dic[@"consumption"][@"playCount"];
        self.replyCount = dic[@"consumption"][@"replyCount"];
        

        
    }

    return self;

}










@end

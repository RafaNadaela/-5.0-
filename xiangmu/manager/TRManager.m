//
//  TRManager.m
//  xiangmu
//
//  Created by tarena on 15/12/26.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRManager.h"
#import "TRDailyList.h"
#import "TRVideoList.h"

#import "TRSecondshuju.h"

@implementation TRManager


//+(NSArray *)getdailylist:(id)dictionary
//{
//    NSArray* array = dictionary[@"dailyList"];
//    
//    NSMutableArray* mutablearray = [NSMutableArray array];
//    
//    for (NSDictionary* dic in array) {
//        
//        TRDailyList* dailist = [TRDailyList new];
//        
//        [dailist setValuesForKeysWithDictionary:dic];
//        [mutablearray addObject:dailist];
//    }
//
//    return [mutablearray copy];
//
//
//}
//
//
//+(NSArray *)getvideolist:(id)dic
//{
//    //最外层的 （section）
//   // NSArray* array12 = [self getdailylist:dic];
//    
//    NSArray* array12 = dic[@"dailyList"];
//
//    NSMutableArray* mutablearray = [NSMutableArray array];
//    
//    for (NSDictionary* dic11 in array12) {
//    
//        NSArray* array34 = dic11[@"videoList"];
//        
//        for (NSDictionary* dic34 in array34) {
//            
//            TRVideoList* list = [[TRVideoList alloc]init];
//            
//            [list setValuesForKeysWithDictionary:dic34];
//            
//            [mutablearray addObject:list];
//            
//            
//        }
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
////    for (int i = 0; i< array12.count; i++) {
////    
////        NSArray* array = dic[@"dailyList"][i][@"videoList"];
////        
////        for (NSDictionary* dic1 in array) {
////            
////            TRVideoList* list = [TRVideoList setparseviodel:dic1];
////            //        TRVideoList* list = [TRVideoList new];
////            //
////            //        [list setValuesForKeysWithDictionary:dic1];
////            
////            [mutablearray addObject:list];
//    
//            
////        }
////     }
//   return [mutablearray copy];
//
//}
//
//
//
//+(NSArray *)getsecondshuju:(NSArray *)ary
//{
//
//    NSMutableArray* mutablearray = [NSMutableArray array];
//    
//    for (NSDictionary* dic in ary) {
//        
//        TRSecondshuju* second = [TRSecondshuju new];
//        
//        [second setValuesForKeysWithDictionary:dic];
//        
//        [mutablearray addObject:second];
//        
//    }
//    return mutablearray;
//
//
//
//
//
//
//
//}
//
//
//+(NSArray *)getvideolist11:(id)dic{
//
//    NSArray* array = dic[@"videoList"];
//    
//    NSMutableArray* mutablearray = [NSMutableArray array];
//    
//    for (NSDictionary* dictionary in array) {
//        
//        TRVideoList* videolist = [TRVideoList setlistmodel:dictionary];
////        
////        [videolist setValuesForKeysWithDictionary:dictionary];
////        
////        [mutablearray addObject:videolist];
//        
//        [mutablearray addObject:videolist];
//        
//    }
//
//    return [mutablearray copy];
//}
//





+(NSArray *)getdailylist:(id)dictionary
{
    NSArray* array = dictionary[@"dailyList"];
    
    NSMutableArray* mutablearray = [NSMutableArray array];
    
    for (NSDictionary* dic in array) {
        
        TRDailyList* dailist = [TRDailyList new];
        
        [dailist setValuesForKeysWithDictionary:dic];
        [mutablearray addObject:dailist];
    }
    
    return [mutablearray copy];
    
    
}


+(NSArray *)getvideolist:(id)dic
{
    NSArray* array12 = [self getdailylist:dic];
    
    NSMutableArray* mutablearray = [NSMutableArray array];
    
    for (int i = 0; i< array12.count; i++) {
        
        NSArray* array = dic[@"dailyList"][i][@"videoList"];
        
        for (NSDictionary* dic1 in array) {
            
            TRVideoList* list = [TRVideoList setparseviodel:dic1];
            //        TRVideoList* list = [TRVideoList new];
            //
            //        [list setValuesForKeysWithDictionary:dic1];
            
            [mutablearray addObject:list];
            
            
        }
    }
    return [mutablearray copy];
    
}



+(NSArray *)getsecondshuju:(NSArray *)ary
{
    
    NSMutableArray* mutablearray = [NSMutableArray array];
    
    for (NSDictionary* dic in ary) {
        
        TRSecondshuju* second = [TRSecondshuju new];
        
        [second setValuesForKeysWithDictionary:dic];
        
        [mutablearray addObject:second];
        
    }
    return mutablearray;
    
    
    
    
    
    
    
}


+(NSArray *)getvideolist11:(id)dic{
    
    NSArray* array = dic[@"videoList"];
    
    NSMutableArray* mutablearray = [NSMutableArray array];
    
    for (NSDictionary* dictionary in array) {
        
        TRVideoList* videolist = [TRVideoList setlistmodel:dictionary];
        //
        //        [videolist setValuesForKeysWithDictionary:dictionary];
        //
        //        [mutablearray addObject:videolist];
        
        [mutablearray addObject:videolist];
        
    }
    
    return [mutablearray copy];
}











@end

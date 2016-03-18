//
//  UIImageView+yuanjiaoimageview.m
//  xiangmu
//
//  Created by tarena on 16/1/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIImageView+yuanjiaoimageview.h"

@implementation UIImageView (yuanjiaoimageview)


-(void)tupianyuanjiaoshezhi{

    //因为是继承自 uitableview ，所以设置直接用 self即可
    
    //让图片
    self.layer.cornerRadius = self.bounds.size.width *0.5;
    
    self.layer.masksToBounds = YES ;
    
    [self.layer setBorderWidth:2];
    
    [self.layer setBorderColor:[UIColor redColor].CGColor];



}







@end

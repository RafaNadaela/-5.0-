//
//  TRCustomCollectionViewCell.m
//  xiangmu
//
//  Created by tarena on 15/12/24.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRCustomCollectionViewCell.h"

#import "UIImageView+WebCache.h"

@interface TRCustomCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TRCustomCollectionViewCell


//重写 set方法

-(void)setSecondshuju:(TRSecondshuju *)secondshuju
{

    _secondshuju = secondshuju ;
    
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:secondshuju.bgPicture] placeholderImage:[UIImage imageNamed:@""]];
    
    self.label.text = secondshuju.name;






}















@end

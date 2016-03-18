//
//  TRTableViewCell.m
//  xiangmu
//
//  Created by tarena on 16/1/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRTableViewCell.h"

#import "UIImageView+WebCache.h"


@interface TRTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview11;

@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@property (weak, nonatomic) IBOutlet UILabel *categorylabel;

@property (weak, nonatomic) IBOutlet UILabel *durationlabel;



@end

@implementation TRTableViewCell


//可以重写 set 方法 来 赋值

-(void)setList:(TRVideoList *)list{


    _list = list ;
    
    [self.imageview11 sd_setImageWithURL:[NSURL URLWithString:list.coverForDetail]];
   
    self.titlelabel.text = list.title ;
    
    self.categorylabel.text = list.category ;
    
    self.durationlabel.text = list.duration.description ;



}










@end

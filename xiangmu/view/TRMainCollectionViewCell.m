//
//  TRMainCollectionViewCell.m
//  xiangmu
//
//  Created by tarena on 15/12/27.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TRMainCollectionViewCell.h"

#import "UIImageView+WebCache.h"

@interface TRMainCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@property (weak, nonatomic) IBOutlet UILabel *categorylabel;

@property (weak, nonatomic) IBOutlet UILabel *durationlabel;




@end



@implementation TRMainCollectionViewCell


-(void)setVideolist:(TRVideoList *)videolist
{
    _videolist = videolist;
    
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:videolist.coverForFeed] placeholderImage:[UIImage imageNamed:@""]];
    
    self.titlelabel.text = videolist.title ;
    
    self.categorylabel.text = videolist.category;
    
    self.durationlabel.text = videolist.duration.description;



}




@end

//
//  JTCell.m
//  JTCollectionView
//
//  Created by Joy Tao on 9/27/12.
//  Copyright (c) 2012 Joy Tao. All rights reserved.
//

#import "JTCell.h"

@implementation JTCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.cellTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(20.0f, 0.0f, frame.size.width - 40.0f , 20.0f)];
        self.cellTitleLable.textAlignment = NSTextAlignmentCenter;
        self.cellTitleLable.backgroundColor = [UIColor clearColor];
        self.cellTitleLable.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.cellTitleLable];
        
        self.itemImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 120.0f, 120.0f)];
        self.itemImageView.frame = CGRectOffset(self.itemImageView.frame, 20.0f, 20.0f);
        [self.contentView addSubview:self.itemImageView];
        
//        self.itemTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, frame.origin.y + frame.size.height - 16.0f, frame.size.width , 16.0f)];
//        self.itemTitleLabel.textAlignment = NSTextAlignmentCenter;
//        self.itemTitleLabel.backgroundColor = [UIColor clearColor];
//        self.itemTitleLabel.textColor = [UIColor whiteColor];
//        [self.contentView addSubview:self.itemTitleLabel];
        
    }
    return self;
}

@end

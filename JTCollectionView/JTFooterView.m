//
//  UIFooterView.m
//  JTCollectionView
//
//  Created by Joy Tao on 10/3/12.
//  Copyright (c) 2012 Joy Tao. All rights reserved.
//

#import "JTFooterView.h"

@implementation JTFooterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"divider_bar"]];
        imageView.frame = CGRectMake(0.0, 0.0, frame.size.width, frame.size.height);
        [self addSubview:imageView];
    }
    return self;
}

@end

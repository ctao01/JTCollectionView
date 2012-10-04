//
//  JTHeaderView.m
//  JTCollectionView
//
//  Created by Joy Tao on 10/3/12.
//  Copyright (c) 2012 Joy Tao. All rights reserved.
//

#import "JTHeaderView.h"

@implementation JTHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.sectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.sectionLabel.textAlignment = NSTextAlignmentCenter;
        self.sectionLabel.backgroundColor = [UIColor clearColor];
        self.sectionLabel.textColor = [UIColor blackColor];
        self.sectionLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20.0f];
        [self addSubview:self.sectionLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

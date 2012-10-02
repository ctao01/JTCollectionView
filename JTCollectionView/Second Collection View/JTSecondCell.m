//
//  JTSecondCell.m
//  JTCollectionView
//
//  Created by Joy Tao on 10/2/12.
//  Copyright (c) 2012 Joy Tao. All rights reserved.
//

#import "JTSecondCell.h"

@implementation JTSecondCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
                
        // Initialization code
        self.clearLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.clearLabel.textAlignment = NSTextAlignmentCenter;
        self.clearLabel.backgroundColor = [UIColor clearColor];
        self.clearLabel.textColor = [UIColor blackColor];
        self.clearLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:8.0f];
        [self.contentView addSubview:self.clearLabel];
        
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

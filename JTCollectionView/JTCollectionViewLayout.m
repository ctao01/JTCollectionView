//
//  CollectionViewLayout.m
//  CollectionViewExample
//
//  Created by Paul Dakessian on 9/6/12.
//  Copyright (c) 2012 Paul Dakessian, CapTech Consulting. All rights reserved.
//

#import "JTCollectionViewLayout.h"

@implementation JTCollectionViewLayout

-(id)init
{
    self = [super init];
    if (self) {
        self.
        self.itemSize = CGSizeMake(150.0f, 150.0f);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumInteritemSpacing = 10.0f;
        self.minimumLineSpacing = 10.0f;
    }
    return self;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray * array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    return array;
}

 
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

@end
//
//  JTSecondViewLayout.m
//  JTCollectionView
//
//  Created by Joy Tao on 10/2/12.
//  Copyright (c) 2012 Joy Tao. All rights reserved.
//

#import "JTSecondViewLayout.h"

@implementation JTSecondViewLayout

-(id)init
{
    self = [super init];
    if (self) {
        self.
        self.itemSize = CGSizeMake(70.0f, 70.0f);
        self.headerReferenceSize = CGSizeMake(0, 44.0f);
        self.footerReferenceSize = CGSizeMake(0, 5.0f);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumInteritemSpacing = 8.0f;
        self.minimumLineSpacing = 8.0f;
        self.sectionInset = UIEdgeInsetsMake(5.0f, 2.0f, 10.0f, 2.0f);
    
        
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

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * attributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        
    return attributes;
}


//- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"layoutAttributesForItemAtIndexPath");
//    UICollectionViewLayoutAttributes * attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
//    if (indexPath.section %2 != 0)
//        attributes.size = CGSizeMake(150.0f, 150.0f);
//    else
//        attributes.size = CGSizeMake(70.0f, 70.0f);
//    
//    return attributes;
//}



@end

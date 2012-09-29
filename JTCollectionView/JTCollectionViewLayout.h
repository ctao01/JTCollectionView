//
//  CollectionViewLayout.h
//  CollectionViewExample
//
//  Created by Paul Dakessian on 9/6/12.
//  Copyright (c) 2012 Paul Dakessian, CapTech Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTCollectionViewLayout : UICollectionViewFlowLayout
{
    UICollectionViewScrollDirection scrollDirection;
}
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;

-(UICollectionViewScrollDirection) scrollDirection;
@end

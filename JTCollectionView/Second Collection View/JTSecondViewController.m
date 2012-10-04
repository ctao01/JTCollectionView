//
//  JTSecondViewController.m
//  JTCollectionView
//
//  Created by Joy Tao on 10/2/12.
//  Copyright (c) 2012 Joy Tao. All rights reserved.
//

#import "JTSecondViewController.h"
#import "JTSecondCell.h"
#import "JTHeaderView.h"
#import "JTFooterView.h"

//#import "JTSecondViewLayout.h"


@interface JTSecondViewController ()

@property (nonatomic , strong) UICollectionView * collectionView;


@end

@implementation JTSecondViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    JTSecondViewLayout * layout = [[JTSecondViewLayout alloc]init];
//    self.collectionView.collectionViewLayout = layout;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 44.0f, 0.0f);
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.collectionView registerClass:[JTHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JTHeaderView"];
    [self.collectionView registerClass:[JTFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"JTFooterView"];
    [self.collectionView registerClass:[JTSecondCell class] forCellWithReuseIdentifier:@"JTSecondCell"];

    self.navigationItem.title = @"Grid Collection View";

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView DataSource Method

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     if (section %3 == 0 ) return 8;
     else if (section %3 == 1) return 4;
     else  if (section %3 == 2) return 20;
     else return 0;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JTSecondCell * jtCell = (JTSecondCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"JTSecondCell" forIndexPath:indexPath];
//    jtCell.clearLabel.text = [NSString stringWithFormat:@"(section%d, item%d)",indexPath.section,indexPath.item];
//    jtCell.clearLabel.text = [NSString stringWithFormat:@"(%d, %d)",indexPath.section,indexPath.item];
    if (indexPath.section % 3 == 0) {
        switch (indexPath.item % 4) {
            case 0:
                jtCell.backgroundColor = [UIColor yellowColor];
                break;
            case 1:
                jtCell.backgroundColor = [UIColor blueColor];
                break;
            case 2:
                jtCell.backgroundColor = [UIColor redColor];
                break;
            case 3:
                jtCell.backgroundColor = [UIColor whiteColor];
                break;
            default:
                break;
        }
    }
    else if (indexPath.section % 3 == 1)
    {
        switch (indexPath.item % 4) {
            case 0:
                jtCell.backgroundColor = [UIColor darkGrayColor];
                break;
            case 1:
                jtCell.backgroundColor = [UIColor purpleColor];
                break;
            case 2:
                jtCell.backgroundColor = [UIColor greenColor];
                break;
            case 3:
                jtCell.backgroundColor = [UIColor brownColor];
                break;
            default:
                break;
        }
    }
    else if (indexPath.section % 3 == 2)
    {
        switch (indexPath.item % 4) {
            case 0:
                jtCell.backgroundColor = [UIColor darkGrayColor];
                break;
            case 1:
                jtCell.backgroundColor = [UIColor yellowColor];
                break;
            case 2:
                jtCell.backgroundColor = [UIColor redColor];
                break;
            case 3:
                jtCell.backgroundColor = [UIColor brownColor];
                break;
            default:
                break;
        }
    }

    return jtCell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
   
    UICollectionReusableView * reusableView;
    if (kind == UICollectionElementKindSectionHeader)
    {
        JTHeaderView * jtHeaderView =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JTHeaderView" forIndexPath:indexPath];
        
        jtHeaderView.sectionLabel.text = [NSString stringWithFormat:@"Section%d",indexPath.section];
        reusableView = jtHeaderView;
    }
    else
    {
        JTFooterView * jtFooterView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"JTFooterView" forIndexPath:indexPath];
        reusableView = jtFooterView;
    }
    
    return reusableView;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * message = [NSString stringWithFormat:@"You choose item-%d at section-%d",indexPath.item, indexPath.section];
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"Notice" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"sizeForItemAtIndexPath");
    if (indexPath.section %3 == 0)
        return CGSizeMake(70.0f, 70.0f);
    else if (indexPath.section % 3 ==1 )
        return CGSizeMake(150.0f, 150.0f);
    else
        return CGSizeMake(50.0f, 50.0f);
}


@end

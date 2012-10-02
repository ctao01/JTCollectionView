//
//  JTSecondViewController.m
//  JTCollectionView
//
//  Created by Joy Tao on 10/2/12.
//  Copyright (c) 2012 Joy Tao. All rights reserved.
//

#import "JTSecondViewController.h"
#import "JTSecondCell.h"

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
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     return 8;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JTSecondCell * jtCell = (JTSecondCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"JTSecondCell" forIndexPath:indexPath];
    jtCell.clearLabel.text = [NSString stringWithFormat:@"(section%d, item%d)",indexPath.section,indexPath.item];
//    jtCell.clearLabel.text = [NSString stringWithFormat:@"(%d, %d)",indexPath.section,indexPath.item];
    if (indexPath.section % 2 == 0) {
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
    else
    {
        switch (indexPath.item % 4) {
            case 0:
                jtCell.backgroundColor = [UIColor lightGrayColor];
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
    

    return jtCell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * message = [NSString stringWithFormat:@"You choose item-%d at section-%d",indexPath.item, indexPath.section];
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"Notice" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}

@end

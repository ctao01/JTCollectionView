//
//  JTViewController.m
//  JTCollectionView
//
//  Created by Joy Tao on 9/27/12.
//  Copyright (c) 2012 Joy Tao. All rights reserved.
//

#import "JTViewController.h"
#import "JTCell.h"
#import "JTCollectionViewLayout.h"

@interface JTViewController ()

@property (nonatomic , strong) NSArray * groupCollection;
@property (nonatomic , strong) UICollectionView * collectionView;
@end

@implementation JTViewController

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.title = @"Collection View Demo";
    
    UIBarButtonItem * otherItem = [[UIBarButtonItem alloc]initWithTitle:@"other" style:UIBarButtonItemStyleBordered target:self action:@selector(gotoOtherCollectionView)];
    self.navigationItem.rightBarButtonItem = otherItem;
    
    // Configure Layout
    JTCollectionViewLayout * layout = [[JTCollectionViewLayout alloc]init];
    
    // Initialize Collection View
    
    CGRect frame = self.view.frame;
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y - 20, frame.size.width, frame.size.height);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:newFrame collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 44.0f, 0.0f);
    [self.collectionView registerClass:[JTCell class] forCellWithReuseIdentifier:@"JTCell"];

    
    [self.view addSubview:self.collectionView];

    // Define Group
    NSMutableArray * fCollection = [[NSMutableArray alloc]initWithObjects:
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"Joy",@"name",@"joy.jpeg",@"profile_pic", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"Century",@"name",@"century.jpg",@"profile_pic", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"Mei",@"name",@"mei.jpg",@"profile_pic", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"MiMi",@"name",@"mimi.jpg",@"profile_pic", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"Keira",@"name",@"keira.jpg",@"profile_pic", nil],
                                    nil];
    NSMutableArray * mCollection = [[NSMutableArray alloc]initWithObjects:
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"Bin",@"name",@"bin.jpg",@"profile_pic", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"Ricky",@"name",@"gecko.jpg",@"profile_pic", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"Rocker",@"name",@"nyu.jpg",@"profile_pic", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"Travis",@"name",@"shi.jpg",@"profile_pic", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:@"Wen",@"name",@"wen.jpg",@"profile_pic", nil],
                                    nil];
    self.groupCollection = [NSArray arrayWithObjects:fCollection,mCollection, nil];
    
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) gotoOtherCollectionView
{
    // TODO: Another Collection View
}

#pragma mark - UICollectionView DataSource Method

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.groupCollection count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if (section == 0) return [[self.groupCollection objectAtIndex:0] count];
    else if (section == 1) return [[self.groupCollection objectAtIndex:1] count];
    else return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JTCell * jtCell = (JTCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"JTCell" forIndexPath:indexPath];
    jtCell.cellTitleLable.text = [NSString stringWithFormat:@"cell%d",indexPath.item];
//    jtCell.itemTitleLabel.text = [NSString stringWithFormat:@"%d",indexPath.item];
    NSArray * array = [self.groupCollection objectAtIndex:indexPath.section];
    
    NSString * image = [[array objectAtIndex:indexPath.item] objectForKey:@"profile_pic"];
    NSString * name = [[array objectAtIndex:indexPath.item] objectForKey:@"name"];
    
    jtCell.itemImageView.image = [UIImage imageNamed:image];
    jtCell.cellTitleLable.text = name;

    return jtCell;
}

@end

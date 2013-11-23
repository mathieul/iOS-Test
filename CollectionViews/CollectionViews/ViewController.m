//
//  ViewController.m
//  CollectionViews
//
//  Created by Mathieu Lajugie on 11/17/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"

static NSString *kCollectionViewCellIdentifier = @"Cells";

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
//{
//    self = [super initWithCollectionViewLayout:layout];
//    if (self != nil) {
//        [self.collectionView registerClass:[UICollectionViewCell class]
//                forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
//    }
//    return self;
//}

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self != nil) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([MyCollectionViewCell class])
                                    bundle:[NSBundle mainBundle]];
        [self.collectionView registerNib:nib
              forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSArray *)allSectionColors
{
    static NSArray *allSectionColors = nil;
    
    if (allSectionColors == nil) {
        allSectionColors = @[
                             [UIColor redColor],
                             [UIColor greenColor],
                             [UIColor blueColor]
                             ];
    }
    
    return allSectionColors;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self allSectionColors].count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10 + arc4random_uniform(11);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier
                                  forIndexPath:indexPath];
    cell.backgroundColor = [self allSectionColors][indexPath.section];
    cell.textLabel.text = @"ALLO";

    return cell;
}

@end

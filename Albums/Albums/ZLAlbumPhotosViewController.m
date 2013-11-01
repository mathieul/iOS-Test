//
//  ZLAlbumPhotosViewController.m
//  Albums
//
//  Created by Mathieu Lajugie on 10/31/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ZLAlbumPhotosViewController.h"
#import "ZLAssetsLibrary.h"
#import "ZLPhotoCollectionViewCell.h"

@interface ZLAlbumPhotosViewController ()

@end

@implementation ZLAlbumPhotosViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = [self.album valueForProperty:ALAssetsGroupPropertyName];
    self.photos = [NSMutableArray new];
    [self loadPhotos];
}

- (void)loadPhotos
{
    [self.album enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop)
    {
        if ([result valueForProperty:ALAssetPropertyType] == ALAssetTypePhoto) {
            [self.photos addObject:result];
        }
    }];
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"photoCell";
    ZLPhotoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    ALAsset *asset = self.photos[indexPath.row];
    cell.imageView.image = [UIImage imageWithCGImage:asset.thumbnail];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

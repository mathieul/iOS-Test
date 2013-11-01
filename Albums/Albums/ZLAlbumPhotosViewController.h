//
//  ZLAlbumPhotosViewController.h
//  Albums
//
//  Created by Mathieu Lajugie on 10/31/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ZLAlbumPhotosViewController : UICollectionViewController

@property (nonatomic, strong) ALAssetsGroup *album;
@property (nonatomic, strong) NSMutableArray *photos;

@end

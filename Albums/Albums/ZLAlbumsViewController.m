//
//  ZLAlbumsViewController.m
//  Albums
//
//  Created by Mathieu Lajugie on 10/31/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ZLAlbumsViewController.h"
#import "ZLAssetsLibrary.h"
#import "ZLAlbumTableViewCell.h"
#import "ZLAlbumPhotosViewController.h"

@interface ZLAlbumsViewController ()

@end

@implementation ZLAlbumsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.albums = [NSMutableArray array];
    [self loadAlbums];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.albums count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"albumCell";

    ZLAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ZLAlbumTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setFromAlbum:self.albums[indexPath.row]];
    
    return cell;
}

- (void) loadAlbums
{
    ZLAssetsLibrary *library = [ZLAssetsLibrary defaultInstance];
    [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop)
    {
        if (group) {
            [self.albums addObject:group];
        }
        if (stop) {
            [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
        }
    } failureBlock:^(NSError *error)
    {
        NSLog(@"Problem loading albums: %@", error);
    }];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TRUE;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.albums removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
    ZLAlbumPhotosViewController *viewController = (ZLAlbumPhotosViewController*)[segue destinationViewController];
    ALAssetsGroup *album = self.albums[selectedIndex.row];
    [viewController setAlbum:album];
    [self.tableView deselectRowAtIndexPath:selectedIndex animated:YES];
}


@end

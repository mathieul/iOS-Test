//
//  ZLAlbumTableViewCell.m
//  Albums
//
//  Created by Mathieu Lajugie on 10/31/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ZLAlbumTableViewCell.h"

@implementation ZLAlbumTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setFromAlbum:(ALAssetsGroup *)album
{
    self.albumImageView.image = [UIImage imageWithCGImage:album.posterImage];
    self.albumTitleLabel.text = [album valueForProperty:ALAssetsGroupPropertyName];
}

@end

//
//  ZLAssetsLibrary.m
//  Albums
//
//  Created by Mathieu Lajugie on 10/31/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ZLAssetsLibrary.h"

@implementation ZLAssetsLibrary

+ (ZLAssetsLibrary *) defaultInstance
{
    static ZLAssetsLibrary *singleton = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^
    {
        singleton = [[super alloc] init];
    });
    
    return singleton;
}

@end

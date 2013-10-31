//
//  IAViewController.h
//  Tasks
//
//  Created by Mathieu Lajugie on 10/30/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *tasks;

@end

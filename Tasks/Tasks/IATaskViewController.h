//
//  IATaskViewController.h
//  Tasks
//
//  Created by Mathieu Lajugie on 10/30/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IATaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (assign, nonatomic) NSString *task;
@property (assign, nonatomic) id delegate;

- (IBAction)completeTask:(id)sender;

@end

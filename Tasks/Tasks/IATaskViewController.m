//
//  IATaskViewController.m
//  Tasks
//
//  Created by Mathieu Lajugie on 10/30/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "IATaskViewController.h"
#import "IAViewController.h"

@interface IATaskViewController ()

@end

@implementation IATaskViewController

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
	self.taskLabel.text = self.task;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)completeTask:(id)sender
{
    IAViewController *tasksListView = (IAViewController *) self.delegate;
    [tasksListView.tasks removeObject:self.task];
    [self.navigationController popViewControllerAnimated:YES];
}
@end

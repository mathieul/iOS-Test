//
//  IANewTaskViewController.m
//  Tasks
//
//  Created by Mathieu Lajugie on 10/30/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "IANewTaskViewController.h"
#import "IAViewController.h"

@interface IANewTaskViewController ()

@end

@implementation IANewTaskViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)saveTask:(id)sender
{
    if ([self.textField.text length] == 0) { return; }
    IAViewController *tasksListView = (IAViewController *)self.delegate;
    [tasksListView.tasks addObject:self.textField.text];
    [self cancel:sender];
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

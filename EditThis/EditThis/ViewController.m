//
//  ViewController.m
//  EditThis
//
//  Created by Mathieu Lajugie on 11/2/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextView *myTextView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.myTextView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.myTextView.text = @"Some text here";
    self.myTextView.contentInset = UIEdgeInsetsMake(10.0f, 0.0f, 0.0f, 0.0f);
    self.myTextView.font = [UIFont systemFontOfSize:16.0f];
    [self.view addSubview:self.myTextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

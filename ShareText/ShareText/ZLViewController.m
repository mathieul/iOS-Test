//
//  ZLViewController.m
//  ShareText
//
//  Created by Mathieu Lajugie on 11/2/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ZLViewController.h"

@interface ZLViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *buttonShare;
@property (nonatomic, strong) UIActivityViewController *activityViewController;

@end

@implementation ZLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createTextField];
    [self createButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)createTextField
{
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 35.0f, 280.0f, 30.0f)];
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter text to share...";
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
}

- (void)createButton
{
    self.buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonShare.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonShare.frame = CGRectMake(20.0f, 80.0f, 280.0f, 44.0f);
    [self.buttonShare setTitle:@"Share" forState:UIControlStateNormal];
    [self.buttonShare addTarget:self
                         action:@selector(handleShare:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonShare];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)handleShare:(id)paramSender
{
    if ([self.textField.text length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:nil
                                        message:@"Please enter a message and press Share"
                                       delegate:nil
                              cancelButtonTitle:@"Ok"
                              otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {
        self.activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[self.textField.text]
                                                                        applicationActivities:nil];
        [self presentViewController:self.activityViewController
                           animated:YES completion:^{}];
    }
}

@end

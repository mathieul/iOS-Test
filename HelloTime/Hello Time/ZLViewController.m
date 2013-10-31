//
//  ZLViewController.m
//  Hello Time
//
//  Created by Mathieu Lajugie on 10/28/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ZLViewController.h"

@interface ZLViewController ()

@end

@implementation ZLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self checkTime:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    CGRect timeFrame = self.timeLabel.frame;
    float viewHeight = self.view.frame.size.height;
    float viewWidth  = self.view.frame.size.width;
    float fontSize   = 30.0f;
    BOOL hideButton  = YES;
    
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        fontSize = 40.0f;
        timeFrame.origin.y = (viewWidth / 2) - timeFrame.size.height;
        timeFrame.size.width = viewHeight;
    }
    else {
        hideButton = NO;
        timeFrame.origin.y = (viewHeight / 2) - timeFrame.size.height;
        timeFrame.size.width = viewWidth;
    }
    
    [self.modeButton setHidden:hideButton];
    [self.timeLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [self.timeLabel setFrame:timeFrame];
}

- (NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait |
        UIInterfaceOrientationMaskLandscape;
}

- (void)checkTime:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm:ss a"];
    [self.timeLabel setText:[formatter stringFromDate:[NSDate date]]];
    
    [self performSelector:@selector(checkTime:) withObject:self afterDelay:1.0];
}

- (IBAction)toggleMode:(id)sender {
    if ([self.modeButton.titleLabel.text
         isEqualToString:@"Night"]) {
        self.view.backgroundColor = [UIColor blackColor];
        self.timeLabel.textColor = [UIColor whiteColor];
        [self.modeButton setTitle:@"Day" forState:UIControlStateNormal];
    }
    else {
        self.view.backgroundColor = [UIColor whiteColor];
        self.timeLabel.textColor = [UIColor blackColor];
        [self.modeButton setTitle:@"Night" forState:UIControlStateNormal];
    }
}

@end

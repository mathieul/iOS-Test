//
//  ZLViewController.h
//  Hello Time
//
//  Created by Mathieu Lajugie on 10/28/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *modeButton;

- (IBAction)toggleMode:(id)sender;

@end

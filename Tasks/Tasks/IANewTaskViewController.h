//
//  IANewTaskViewController.h
//  Tasks
//
//  Created by Mathieu Lajugie on 10/30/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IANewTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) id delegate;

- (IBAction)saveTask:(id)sender;
- (IBAction)cancel:(id)sender;

@end

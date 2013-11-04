//
//  ViewController.m
//  Gravity
//
//  Created by Mathieu Lajugie on 11/3/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ViewController.h"

NSString *const kBottomBoundary = @"bottomBoundary";


@interface ViewController ()
@property (nonatomic, strong) UIView *squareView;
@property (nonatomic, strong) UIView *squareViewAnchorView;
@property (nonatomic, strong) UIView *anchorView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@end

@implementation ViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self createSmallSquareView];
    [self createAnchorView];
    [self createGestureRecognizer];
    [self createAnimatorAndBehaviors];
}

- (void)createSmallSquareView
{
    self.squareView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 80.0f)];
    self.squareView.backgroundColor = [UIColor greenColor];
    self.squareView.center = self.view.center;

    self.squareViewAnchorView = [[UIView alloc]
                                 initWithFrame:CGRectMake(60.0f, 0.0f, 20.0f, 20.0f)];
    self.squareViewAnchorView.backgroundColor = [UIColor brownColor];

    [self.squareView addSubview:self.squareViewAnchorView];
    [self.view addSubview:self.squareView];
}

- (void)createAnchorView
{
    self.anchorView = [[UIView alloc] initWithFrame:CGRectMake(120.0f, 120.0f, 20.0f, 20.0f)];
    self.anchorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.anchorView];
}

- (void)createGestureRecognizer
{
    UIPanGestureRecognizer *panGestureRecognizer =
        [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)createAnimatorAndBehaviors
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UICollisionBehavior *collision =
        [[UICollisionBehavior alloc] initWithItems:@[self.squareView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];

    self.attachmentBehavior = [[UIAttachmentBehavior alloc]
                               initWithItem:self.squareView
                               attachedToAnchor:self.anchorView.center];
    [self.animator addBehavior:self.attachmentBehavior];
}

- (void)handlePan:(UIPanGestureRecognizer *)paramPan
{
    CGPoint tapPoint = [paramPan locationInView:self.view];
    [self.attachmentBehavior setAnchorPoint:tapPoint];
    self.anchorView.center = tapPoint;
}

@end

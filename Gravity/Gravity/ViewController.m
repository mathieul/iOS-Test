//
//  ViewController.m
//  Gravity
//
//  Created by Mathieu Lajugie on 11/3/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "ViewController.h"

NSString *const kBottomBoundary = @"bottomBoundary";


@interface ViewController () <UICollisionBehaviorDelegate>
@property (nonatomic, strong) NSMutableArray *squareViews;
@property (nonatomic, strong) UIDynamicAnimator *animator;
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
    
    NSUInteger const NumberOfViews = 2;
    
    self.squareViews = [[NSMutableArray alloc] initWithCapacity:NumberOfViews];
    NSArray *colors = @[[UIColor redColor], [UIColor greenColor]];
    
    CGPoint currentCenterPoint = self.view.center;
    currentCenterPoint.y = 100.0f;
    CGSize eachViewSize = CGSizeMake(50.0f, 50.0f);
    for (NSUInteger counter = 0; counter < NumberOfViews; counter++) {
        UIView *newView = [[UIView alloc] initWithFrame:
                           CGRectMake(0.0f, 0.0f, eachViewSize.width, eachViewSize.height)];
        newView.backgroundColor = colors[counter];
        newView.center = currentCenterPoint;
        currentCenterPoint.y += eachViewSize.height + 10;
        [self.view addSubview:newView];
        [self.squareViews addObject:newView];
    }


    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:self.squareViews];
    [self.animator addBehavior:gravity];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:self.squareViews];
    collision.collisionMode = UICollisionBehaviorModeBoundaries;
    CGFloat y = self.view.bounds.size.height - 50.0f;
    [collision addBoundaryWithIdentifier:@"bottomBoundary"
                               fromPoint:CGPointMake(0.0f, y)
                                 toPoint:CGPointMake(self.view.bounds.size.width, y)];
    collision.collisionDelegate = self;
    [self.animator addBehavior:collision];
}

- (void)collisionBehavior:(UICollisionBehavior*)paramBehavior
      beganContactForItem:(id <UIDynamicItem>)paramItem
   withBoundaryIdentifier:(id <NSCopying>)paramIdentifier
                  atPoint:(CGPoint)paramPoint
{
    NSString *identifier = (NSString *)paramIdentifier;

    if ([identifier isEqualToString:kBottomBoundary]) {
        [UIView animateWithDuration:1.0f animations:^{
            UIView *view = (UIView *)paramItem;
            view.backgroundColor = [UIColor redColor];
            view.alpha = 0.0f;
            view.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
        } completion:^(BOOL finished){
            UIView *view = (UIView *)paramItem;
            [paramBehavior removeItem:paramItem];
            [view removeFromSuperview];
        }];
    }
}

//- (void)collisionBehavior:(UICollisionBehavior*)behavior
//      endedContactForItem:(id <UIDynamicItem>)item
//   withBoundaryIdentifier:(id <NSCopying>)identifier
//{
//    
//}

@end

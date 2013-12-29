//
//  ViewController.m
//  autolayout-animation-example
//
//  Created by Bill Richards on 12/29/13.
//  Copyright (c) 2013 Bill Richards. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *squareView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalConstraint;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton Actions -

- (IBAction)moveButtonAction:(id)sender
{
    CGPoint randomPoint = [self randomPointInView];
    self.verticalConstraint.constant = randomPoint.y;
    self.horizontalConstraint.constant = randomPoint.x;
    
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self.squareView layoutIfNeeded];
    
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - Private -

- (CGPoint)randomPointInView
{
    CGPoint p;
    
    p.x = arc4random() % ((int)CGRectGetWidth(self.view.frame) - (int)CGRectGetWidth(self.squareView.frame));
    p.y = arc4random() % ((int)CGRectGetHeight(self.view.frame) - (int)CGRectGetHeight(self.squareView.frame));
    
    return p;
}

@end

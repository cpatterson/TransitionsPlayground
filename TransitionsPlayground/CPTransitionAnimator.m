//
//  CPTransitionAnimator.m
//  TransitionsPlayground
//
//  Created by Chris Patterson on 10/3/13.
//  Copyright (c) 2013 Chris Patterson. All rights reserved.
//

#import "CPTransitionAnimator.h"

@implementation CPTransitionAnimator

- (id)init
{
	if ((self = [super init])) {
		_popping = NO;
		_startFrame = CGRectZero;
	}
	return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
	return 1.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
	// Grab the from and to view controllers from the context
	UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	UIViewController *to   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	UIView* container = [transitionContext containerView];
	
	if (self.popping)
		[self animatePopFrom:to backTo:from in:container context:transitionContext];
	else
		[self animatePushFrom:from to:to in:container context:transitionContext];
}

- (void)animatePushFrom:(UIViewController*)from
					 to:(UIViewController*)to
					 in:(UIView*)container
				context:(id <UIViewControllerContextTransitioning>)context
{
	[container addSubview:from.view];
	[container addSubview:to.view];

	// Zoom out from the selected cell's frame.
	to.view.alpha = 0.0;
	to.view.frame = self.startFrame;
	to.view.layer.shadowRadius = 5.0;
	to.view.layer.shadowOffset = CGSizeMake(0, 5.0);
	
	[UIView animateWithDuration:0.25f
					 animations:^{
						 to.view.alpha = 1.0;
						 to.view.layer.shadowOpacity = 0.8;
					 }
					 completion:^(BOOL finished) {
						 [UIView animateWithDuration:0.75f
										  animations:^{
											  to.view.frame = from.view.frame;
											  [container layoutIfNeeded];
										  }
										  completion:^(BOOL finished) {
											  [context completeTransition:YES];
										  }];
					 }];
}

- (void)animatePopFrom:(UIViewController*)from
				backTo:(UIViewController*)to
					in:(UIView*)container
			   context:(id <UIViewControllerContextTransitioning>)context
{
	[container addSubview:from.view];
	[container addSubview:to.view];

	// Zoom in to the selected cell's frame.
	
	[UIView animateWithDuration:0.75f
					 animations:^{
						 to.view.frame = self.startFrame;
						 [container layoutIfNeeded];
					 }
					 completion:^(BOOL finished) {
						 [UIView animateWithDuration:0.25f
										  animations:^{
											  to.view.alpha = 0.0;
											  to.view.layer.shadowOpacity = 0.0;
										  }
										  completion:^(BOOL finished) {
											  [context completeTransition:YES];
										  }];
					 }];
}

@end

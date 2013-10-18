//
//  CPTransitionAnimator.h
//  TransitionsPlayground
//
//  Created by Chris Patterson on 10/3/13.
//  Copyright (c) 2013 Chris Patterson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic) CGRect startFrame;

@property (nonatomic) BOOL popping;

// UIViewControllerAnimatedTransitioning methods
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext;
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext;

// Custom methods
- (void)animatePushFrom:(UIViewController*)from
					 to:(UIViewController*)to
					 in:(UIView*)container
				context:(id <UIViewControllerContextTransitioning>)context;

- (void)animatePopFrom:(UIViewController*)from
				backTo:(UIViewController*)to
					in:(UIView*)container
			   context:(id <UIViewControllerContextTransitioning>)context;

@end

//
//  CPDetailViewController.h
//  TransitionsPlayground
//
//  Created by Chris Patterson on 10/3/13.
//  Copyright (c) 2013 Chris Patterson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

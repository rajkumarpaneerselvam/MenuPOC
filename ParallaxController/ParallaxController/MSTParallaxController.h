//
//  MSTParallaxController.h
//  ParallaxController
//
//  Created by Michael Thornton on 1/3/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTParallaxController : UIViewController

@property (nonatomic, assign) CGFloat topViewControllerStandartHeight;
@property (nonatomic, strong) UIViewController *topViewController;
@property (nonatomic, strong) UITableViewController *tableViewController;

- (void)setupWithTopViewController:(UIViewController *)topViewController height:(CGFloat)height tableViewController:(UITableViewController *)tableViewController;
- (void)willChangeHeightOfTopViewControllerFromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight;
- (void)tableViewControllerDidScroll:(UITableViewController *)tableViewController;

@end

//
//  MSTViewController.m
//  ParallaxController
//
//  Created by Michael Thornton on 1/3/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTViewController.h"
#import "MSTImageViewController.h"

@interface MSTViewController ()

@end

@implementation MSTViewController

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


-(void) awakeFromNib
{
    UIViewController *topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MSTImageViewController"];
    UITableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MSTTableViewController"];
    
    [self setupWithTopViewController:topViewController height:150 tableViewController:tableViewController];
    	
}


- (void)willChangeHeightOfTopViewControllerFromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight {
	
    MSTImageViewController * topViewController = (MSTImageViewController *)self.topViewController;
    [topViewController willChangeHeightFromHeight:oldHeight toHeight:newHeight];
    
    float r = (self.topViewControllerStandartHeight * 1.5f) / newHeight;
    [self.tableViewController.view setAlpha:r*r*r*r*r*r];
    
}

@end

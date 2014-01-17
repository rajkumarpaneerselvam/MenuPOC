//
//  MSTFirstMenuMapViewController.m
//  ParallaxController
//
//  Created by Kumaran on 17/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTFirstMenuMapViewController.h"

@interface MSTFirstMenuMapViewController ()

@end

@implementation MSTFirstMenuMapViewController

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
    [self loadDefaultView:@""];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  MSTMailViewController.m
//  ParallaxController
//
//  Created by Rajkumar P on 1/16/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTMailViewController.h"

@interface MSTMailViewController ()

@end

@implementation MSTMailViewController

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
    
    [self setIndex:[NSNumber numberWithInt:3]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

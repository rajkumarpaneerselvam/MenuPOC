//
//  MSTMyAccViewController.m
//  ParallaxController
//
//  Created by Kumaran on 16/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTMyAccViewController.h"

@interface MSTMyAccViewController ()

@end

@implementation MSTMyAccViewController
@synthesize simpleLbl;

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
    [self addSubviewsFromSuperclass];
//    [self.titleLbl setText:@"My Accounts"];
    
    [self loadDefaultView:@"My Accounts"];
    
    NSLog(@"MY Account viewcontroller is called =======");

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

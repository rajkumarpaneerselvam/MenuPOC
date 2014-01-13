//
//  MSTSlideUpMenuViewController.m
//  ParallaxController
//
//  Created by Michael Thornton on 1/12/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTSlideUpMenuViewController.h"
#import "MSTTableViewController.h"
#import "MSTMenuViewController.h"


@interface MSTSlideUpMenuViewController ()

@end

@implementation MSTSlideUpMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) awakeFromNib
{
	
    MSTTableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MSTTableViewController"];
	
	[tableViewController.tableView setBackgroundColor:[UIColor clearColor]];
    [tableViewController.tableView setBackgroundView:nil];
    [tableViewController.view setClipsToBounds:YES];
	
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tableViewController];
	
    [self addChildViewController:nav];
	[self.view addSubview:nav.view];

	[tableViewController didMoveToParentViewController:self];
	
	
	MSTMenuViewController *menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MSTMenuViewController"];
	[menuViewController.view setBackgroundColor:[UIColor clearColor]];
	[menuViewController.view setClipsToBounds:YES];
	
	[self addChildViewController:menuViewController];
	[self.view addSubview:menuViewController.view];
	[menuViewController didMoveToParentViewController:self];
	
	
	
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

@end

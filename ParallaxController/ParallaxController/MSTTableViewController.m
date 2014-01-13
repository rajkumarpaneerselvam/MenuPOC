//
//  MSTTableViewController.m
//  ParallaxController
//
//  Created by Michael Thornton on 1/3/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTTableViewController.h"
#import "MSTParallaxController.h"

@implementation MSTTableViewController


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
	UIViewController *vc = self.parentViewController;
	
	while(vc){
		if([vc isKindOfClass:[MSTParallaxController class]]){
			[(MSTParallaxController *)vc tableViewControllerDidScroll:self];
			vc = nil;
		}
		else{
			vc = vc.parentViewController;
		}
	}
    
}


@end

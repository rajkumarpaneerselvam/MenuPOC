//
//  MSTImageViewController.m
//  ParallaxController
//
//  Created by Michael Thornton on 1/3/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTImageViewController.h"
#import "MSTParallaxController.h"

@implementation MSTImageViewController



- (void)willChangeHeightFromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight {
	
	UIViewController *vc = self.parentViewController;
	MSTParallaxController *parallaxController;
	
	while(vc){
		if([vc isKindOfClass:[MSTParallaxController class]]){
			parallaxController = (MSTParallaxController *)vc;
			break;
		}
		else{
			vc = vc.parentViewController;
		}
	}
	
	
    
    if (newHeight >= parallaxController.topViewControllerStandartHeight) {
        
        [self.imageView setAlpha:1];        
        
    } else {
        
        float r = newHeight / parallaxController.topViewControllerStandartHeight;
        [self.imageView setAlpha:r];
        
    }
    
}


@end

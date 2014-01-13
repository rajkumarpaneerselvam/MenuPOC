//
//  MSTImageViewController.h
//  ParallaxController
//
//  Created by Michael Thornton on 1/3/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTImageViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

- (void)willChangeHeightFromHeight:(CGFloat)oldHeight toHeight:(CGFloat)newHeight;

@end

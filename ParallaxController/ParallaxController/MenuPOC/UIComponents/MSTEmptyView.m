//
//  MSTEmptyView.m
//  ParallaxController
//
//  Created by Rajkumar P on 1/16/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTEmptyView.h"

@implementation MSTEmptyView

@synthesize contextReferance = _contextReferance;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void)drawRect:(CGRect)rect{
    _contextReferance = UIGraphicsGetCurrentContext();
}

@end

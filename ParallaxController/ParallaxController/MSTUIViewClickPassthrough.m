//
//  MSTUIViewClickPassthrough.m
//  ParallaxController
//
//  Created by Michael Thornton on 1/12/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTUIViewClickPassthrough.h"

@implementation MSTUIViewClickPassthrough

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self){
        return nil;
    }
    else {
        return hitView;
    }
}


@end

//
//  AwesomeMenuItem.m
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
//  Copyright (c) 2011 Levey & Other Contributors. All rights reserved.
//

#import "AwesomeMenuItem.h"
static inline CGRect ScaleRect(CGRect rect, float n) {return CGRectMake((rect.size.width - rect.size.width * n)/ 2, (rect.size.height - rect.size.height * n) / 2, rect.size.width * n, rect.size.height * n);}
@implementation AwesomeMenuItem

@synthesize contentImageView = _contentImageView;

@synthesize startPoint = _startPoint;
@synthesize endPoint = _endPoint;
@synthesize nearPoint = _nearPoint;
@synthesize farPoint = _farPoint;
@synthesize delegate  = _delegate;
@synthesize index = _index;
@synthesize menuButton = _menuButton;

#pragma mark - initialization & cleaning up
- (id)initWithImage:(UIImage *)img
   highlightedImage:(UIImage *)himg
       ContentImage:(UIImage *)cimg
highlightedContentImage:(UIImage *)hcimg;
{
    if (self = [super init])
    {
        self.image = img;
        self.highlightedImage = himg;
        self.userInteractionEnabled = YES;
        _contentImageView = [[UIImageView alloc] initWithImage:cimg];
        _contentImageView.highlightedImage = hcimg;
        [self addSubview:_contentImageView];
        
        
    }
    
    // view did load
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(checkifInsideBounds:)
                                                 name:@"menuSelectionUpdated"
                                               object:nil];
    
    
    
    return self;
}

#pragma mark - UIView's methods
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bounds = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    
    float width = _contentImageView.image.size.width;
    float height = _contentImageView.image.size.height;
    _contentImageView.frame = CGRectMake(self.bounds.size.width/2 - width/2, self.bounds.size.height/2 - height/2, width, height);
    
    if(_index){
        UILabel *indexDisplay = [[UILabel alloc] init];
        indexDisplay.frame = CGRectMake((self.bounds.size.width/2 - width/2)+8, (self.bounds.size.height/2 - height/2)+2, width-2, height-2);
        indexDisplay.text =[[NSString alloc] initWithFormat:@"%@",_index];
        [indexDisplay setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [self addSubview:indexDisplay];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    if ([_delegate respondsToSelector:@selector(AwesomeMenuItemTouchesBegan:)])
    {
        [_delegate AwesomeMenuItemTouchesBegan:self];
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // if move out of 2x rect, cancel highlighted.
    //    CGPoint location = [[touches anyObject] locationInView:self];
    //    if (!CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location))
    //    {
    //        self.highlighted = NO;
    //    }
    //    - (void)AwesomeMenuItemTouchesMoved:(AwesomeMenuItem *)item;
    
    
    UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:touch.view];
	_contentImageView.center = location;
    
    
    if ([_delegate respondsToSelector:@selector(AwesomeMenuItemTouchesMoved:)])
    {
        [_delegate AwesomeMenuItemTouchesMoved:self];
    }
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
    // if stop in the area of 2x rect, response to the touches event.
    CGPoint location = [[touches anyObject] locationInView:self];
    if (CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location))
    {
        if ([_delegate respondsToSelector:@selector(AwesomeMenuItemTouchesEnd:)])
        {
            [_delegate AwesomeMenuItemTouchesEnd:self];
        }
    }
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:touches, @"CGPoint",nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuSelectionUpdated" object:self userInfo:options];
    
    if (_menuButton) {
            float width = _contentImageView.image.size.width;
    float height = _contentImageView.image.size.height;
    _contentImageView.frame = CGRectMake(self.bounds.size.width/2 - width/2, self.bounds.size.height/2 - height/2, width, height);
    }
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
}

#pragma mark - instant methods
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [_contentImageView setHighlighted:highlighted];
}


#pragma mark Handle local notification

-(void)checkifInsideBounds:(NSNotification *)notification {
    
    if (_index) {
        
        
        NSDictionary *receivedData = notification.userInfo;
        
        NSSet *touches = [receivedData objectForKey:@"CGPoint"];
        CGPoint location = [[touches anyObject] locationInView:self];
        
        if (CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location))
        {
            if ([_delegate respondsToSelector:@selector(AwesomeMenuItemTouchesEnd:)])
            {
                [_delegate AwesomeMenuItemTouchesEnd:self];
            }
        }
    }
}


@end

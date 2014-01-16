//
//  MSTThirdMenuViewController.m
//  ParallaxController
//
//  Created by Kumaran on 13/01/14.
//  Copyright (c) 2014 Michael Thornton. All rights reserved.
//

#import "MSTThirdMenuViewController.h"
#import "MSTBarCodeViewController.h"


@interface MSTThirdMenuViewController ()

@end

@implementation MSTThirdMenuViewController

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

    vw = [[MSTEmptyView alloc] initWithFrame:self.view.frame];
    
    vw.backgroundColor = [UIColor whiteColor];
    self.view = vw;
    
    [self setupMenu];
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onClickBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

# pragma mark Private methods for the Menu setup

- (void)setupMenu{
    
    
    NSMutableArray *menus = [[NSMutableArray alloc] init];
    
    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"bg-menuitem.png"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
     [startItem setMenuButton:YES];
    
    AwesomeMenuItem *barcode = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"barcode.png"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    
    [barcode setIndex:[[NSNumber alloc] initWithInt:1]];
    [menus addObject:barcode];
    
    AwesomeMenuItem *creditcard = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"credit_card.png"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [creditcard setIndex:[[NSNumber alloc] initWithInt:2]];
    [menus addObject:creditcard];
    
    AwesomeMenuItem *mail = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"mail.png"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [mail setIndex:[[NSNumber alloc] initWithInt:3]];
    [menus addObject:mail];
    
    AwesomeMenuItem *mappin = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"map_pin.png"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [mappin setIndex:[[NSNumber alloc] initWithInt:4]];
    [menus addObject:mappin];
    
    
    AwesomeMenuItem *process = [[AwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"process.png"]
                                                       highlightedImage:[UIImage imageNamed:@"bg-menuitem-highlighted.png"]
                                                           ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]];
    [process setIndex:[[NSNumber alloc] initWithInt:5]];
    [menus addObject:process];
    
   
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds startItem:startItem optionMenus:menus];
    menu.delegate = self;

    menu.menuWholeAngle = 3.0;
	menu.farRadius = 62.0f;
	menu.endRadius = 60.0f;
	menu.nearRadius = 55.0f;
    menu.animationDuration = 0.75f;
    menu.startPoint = CGPointMake(160.0, self.view.frame.size.height-24);
    menu.rotateAngle = 4.8f;
    
    
    [self.view addSubview:menu];
    
    selectedMenuItem = [[UILabel alloc] init];
    [selectedMenuItem setFrame:CGRectMake(10, 40, 200, 40)];

    [self.view addSubview:selectedMenuItem];

}

# pragma mark Menu delegates

- (void)awesomeMenu:(AwesomeMenu *)menu selectedItem:(AwesomeMenuItem *)item didSelectIndex:(NSInteger)idx{
    
    selectedMenuItem.text = [[NSString alloc] initWithFormat:@"Selected menu : %@",item.index];
    

//    barcode
    
    MSTBarCodeViewController *NVC = [self.storyboard instantiateViewControllerWithIdentifier:@"barcode"];
    [self presentViewController:NVC animated:YES completion:nil];
    
    NSLog(@"Stacked View controllers %@",[self.navigationController viewControllers]);
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

- (void)awesomeMenuDidFinishAnimationClose:(AwesomeMenu *)menu{
    
}

- (void)awesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu{
}

# pragma mark Menu items delegates

- (void)AwesomeMenuItemTouchesBegan:(AwesomeMenuItem *)item{
   
}

- (void)AwesomeMenuItemTouchesEnd:(AwesomeMenuItem *)item{
    
}

- (void)AwesomeMenuItemTouchesMoved:(AwesomeMenuItem *)item{
    
}


//- (void)drawlines{
//    
//    CGPoint currentPoint = CGPointMake(20, 20);
//    
//    CGPoint lastPoint = CGPointMake(40, 40);
//    
//    CGContextMoveToPoint(vw.contextReferance, lastPoint.x, lastPoint.y);
//    CGContextAddLineToPoint(vw.contextReferance, currentPoint.x, currentPoint.y);
//    CGContextSetLineCap(vw.contextReferance, kCGLineCapRound);
//    CGContextSetLineWidth(vw.contextReferance, 2 );
//    CGContextSetRGBStrokeColor(vw.contextReferance, 200 , 200, 200, 1.0);
//    CGContextSetBlendMode(vw.contextReferance,kCGBlendModeNormal);
//    
//    CGContextStrokePath(vw.contextReferance);
//    
//
//}
//
//- (void) drawArrowWithContext:(CGContextRef)context atPoint:(CGPoint)start_Point withSize:(CGSize)size lineWidth:(float)width arrowHeight:(float)aheight
//{
//    
//    float width_wing = (size.width-width)/2;
//    float main = size.height-aheight;
//    CGPoint rectangle_points[] =
//    {
//        CGPointMake(start_Point.x + width_wing, start_Point.y + 0.0),
//        CGPointMake(start_Point.x + width_wing, start_Point.y + main),
//        CGPointMake(start_Point.x + 0.0, start_Point.y + main), // left point
//        CGPointMake(start_Point.x + size.width/2, start_Point.y + size.height),
//        
//        CGPointMake(start_Point.x + size.width, start_Point.y + main), // right point
//        
//        CGPointMake(start_Point.x + size.width-width_wing, start_Point.y + main),
//        
//        CGPointMake(start_Point.x + size.width-width_wing, start_Point.y + 0.0),
//        CGPointMake(start_Point.x + width_wing, start_Point.y + 0.0),
//    };
//    
//    CGContextAddLines(context, rectangle_points, 8);
//    
//    CGContextFillPath(context);
//}




@end

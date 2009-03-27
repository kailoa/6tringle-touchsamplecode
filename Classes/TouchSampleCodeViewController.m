/*********************************************************************
 *  \file TouchSampleCodeViewController.m
 *  \author Kailoa Kadano
 *  \date 2009/3/23
 *  \class TouchSampleCodeViewController
 *  \brief Part of TouchSampleCode
 *  \details
 *
 *  \abstract Simple UIView subclass that forwards touch events to the view controller for processing 
 *  \copyright Copyright 2009 6Tringle LLC. All rights reserved.
 */

#import "TouchSampleCodeViewController.h"

#define kTouchUpdateTimer (1.0/15.0)
#define kRotateAngleInRadians 0.1

@implementation TouchSampleCodeViewController

/*********************************************************************/
#pragma mark -
#pragma mark ** Methods **

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [TouchHoldTimer invalidate];
    TouchHoldTimer = nil;
    [FirstTouchTime release];
    [DoubleTapTime release];
    [ActiveTouches release];
    [super dealloc];
}

/*********************************************************************/
#pragma mark -
#pragma mark ** UIViewController Methods **

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Utilities **

CGSize CGSizeDistanceBetween2Points(CGPoint point1, CGPoint point2)
{
    return CGSizeMake(point1.x -point2.x, point1.y - point2.y);
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Touch Timer Methods **
- (void)touchIsBeingPinchedOrStretched:(NSSet *)touches;
{
    // calculate the distance between the two touches    
    CGSize difference = CGSizeDistanceBetween2Points([[ActiveTouches objectAtIndex:0] locationInView:self.view], 
                                                       [[ActiveTouches objectAtIndex:1] locationInView:self.view]);    
    CGFloat x_scale_factor = OriginalDifference.width/difference.width;
    CGFloat y_scale_factor = OriginalDifference.height/difference.height;
    NSLog(@"Scale Factor: %x:f, y:%f", x_scale_factor, y_scale_factor);
    
    // modify the transform in order to scale the view
    PinchAndStretchView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 
                                                           x_scale_factor, 
                                                           y_scale_factor);
}
- (void)touchIsBeingHeldWithTimer:(NSTimer *)timer;
{
    NSSet *touches = [timer userInfo];
    NSInteger count = [[touches anyObject] tapCount];
    NSTimeInterval hold_time = -1*[FirstTouchTime timeIntervalSinceNow];
    if (count == 1) {
        TouchAndHoldCounter += 1;
        TapAndHoldView.transform = CGAffineTransformRotate(TapAndHoldView.transform, kRotateAngleInRadians);
//        NSLog(@"Held for %d counts and %g seconds.", TouchAndHoldCounter, hold_time);
        if (hold_time > HOLD_TIME_DELAY)
            TapAndHoldWithDelayView.transform = CGAffineTransformRotate(TapAndHoldWithDelayView.transform, kRotateAngleInRadians);
            
    }
    else if (count == 2) {
        DoubleTapAndHoldCounter += 1;
        DoubleTapAndHoldView.transform = CGAffineTransformRotate(DoubleTapAndHoldView.transform, -1 * kRotateAngleInRadians);
//        NSLog(@"Held for %d counts and %g seconds.", DoubleTapAndHoldCounter, -1*[DoubleTapTime timeIntervalSinceNow]);
    }
}
- (void)cleanupTimers;
{
    [TouchHoldTimer invalidate];
    TouchHoldTimer = nil;
    [FirstTouchTime release];
    FirstTouchTime = nil;
    [DoubleTapTime release];
    DoubleTapTime = nil;
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Touch Handlers **

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    METHOD_LOG;
    OBJECT_LOG(touches);

    // NSSet *touches is the set of touches that began now.  We want to 
    // keep track of ALL touches, including touches that may have began 
    // sometime ago.  We have our own NSMutableArray* ActiveTouches to 
    // do so.
    if (ActiveTouches == nil)
        ActiveTouches = [[NSMutableArray alloc] init];
    
    for (UITouch *touch in touches) {
        if (![ActiveTouches containsObject:touch])
            [ActiveTouches addObject:touch];
    }
    
    if ([ActiveTouches count] == 1) { //single touch
        //Start touch timer
        TouchAndHoldCounter = 0.0;
        FirstTouchTime = [[NSDate alloc] init];
        TouchHoldTimer = [NSTimer scheduledTimerWithTimeInterval:kTouchUpdateTimer
                                                          target:self
                                                        selector:@selector(touchIsBeingHeldWithTimer:) 
                                                        userInfo:touches
                                                         repeats:YES];
        if ([[touches anyObject] tapCount] == 2)
            DoubleTapTime = [[NSDate alloc] init];
    } else if ([ActiveTouches count] == 2) { //two finger touch
        OriginalDifference = CGSizeDistanceBetween2Points([[ActiveTouches objectAtIndex:0] locationInView:self.view], 
                                                            [[ActiveTouches objectAtIndex:1] locationInView:self.view]);    
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
    if ([ActiveTouches count] == 1) { //single touch
        // do nothing
    } else if ([ActiveTouches count] == 2) { //two finger touch
        [self cleanupTimers];
        [self touchIsBeingPinchedOrStretched:touches];
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
    METHOD_LOG;
    OBJECT_LOG(touches);
    for (UITouch *touch in touches) {
        [ActiveTouches removeObject:touch];
    }
    [self cleanupTimers];
    
    if ([touches count] == 1) { //single touch
        // do nothing
    } else if ([touches count] == 2) { //two finger touch
        //
    }        
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{
    METHOD_LOG;
    [self cleanupTimers];
    [ActiveTouches removeAllObjects];
}

@end

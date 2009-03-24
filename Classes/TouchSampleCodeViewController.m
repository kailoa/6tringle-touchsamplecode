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
- (void)touchIsBeingHeldWithTimer:(NSTimer *)timer;
{
    NSSet *touches = [timer userInfo];
    NSInteger count = [[touches anyObject] tapCount];
    NSTimeInterval hold_time = -1*[FirstTouchTime timeIntervalSinceNow];
    if (count == 1) {
        TouchAndHoldCounter += 1;
        TapAndHoldView.transform = CGAffineTransformRotate(TapAndHoldView.transform, 0.1);
        NSLog(@"Held for %d counts and %g seconds.", TouchAndHoldCounter, hold_time);
        if (hold_time > HOLD_TIME_DELAY)
            TapAndHoldWithDelayView.transform = CGAffineTransformRotate(TapAndHoldWithDelayView.transform, 0.1);
            
    }
    else if (count == 2) {
        DoubleTapAndHoldCounter += 1;
        DoubleTapAndHoldView.transform = CGAffineTransformRotate(DoubleTapAndHoldView.transform, -0.1);
        NSLog(@"Held for %d counts and %g seconds.", DoubleTapAndHoldCounter, -1*[DoubleTapTime timeIntervalSinceNow]);
    }
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Touch Handlers **

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    METHOD_LOG;
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
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
    METHOD_LOG;
}
- (void)cleanup;
{
    [TouchHoldTimer invalidate];
    TouchHoldTimer = nil;
    [FirstTouchTime release];
    FirstTouchTime = nil;
    [DoubleTapTime release];
    DoubleTapTime = nil;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{    
    METHOD_LOG;
    [self cleanup];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{
    METHOD_LOG;
    [self cleanup];
}

@end

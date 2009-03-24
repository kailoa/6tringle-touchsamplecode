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
    [TouchTimer invalidate];
    TouchTimer = nil;
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

- (void)touchIsBeingHeld;
{
    TouchAndHoldCounter += 1;
    TouchAndHoldLabel.transform = CGAffineTransformRotate(TouchAndHoldLabel.transform, .1);
    NSLog(@"Held for %d counts and %g seconds.", TouchAndHoldCounter, -1*[FirstTouchTime timeIntervalSinceNow]);
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
	TouchTimer = [NSTimer scheduledTimerWithTimeInterval:kTouchUpdateTimer
                                                  target:self
                                                selector:@selector(touchIsBeingHeld) 
                                                userInfo:nil 
                                                 repeats:YES];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
    METHOD_LOG;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{    
    METHOD_LOG;
    [TouchTimer invalidate];
    TouchTimer = nil;
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{
    METHOD_LOG;
    [TouchTimer invalidate];
    TouchTimer = nil;
}

@end

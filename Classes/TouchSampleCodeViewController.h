/*********************************************************************
 *  \file TouchSampleCodeViewController.h
 *  \author Kailoa Kadano
 *  \date 2009/3/23
 *  \class TouchSampleCodeViewController
 *  \brief Part of TouchSampleCode
 *  \details
 *
 *  \abstract Simple UIView subclass that forwards touch events to the view controller for processing 
 *  \copyright Copyright 2009 6Tringle LLC. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "MacroUtilities.h"

#define HOLD_TIME_DELAY 1.0 //tap and hold delay time in seconds

@interface TouchSampleCodeViewController : UIViewController 
{
    // Tap and hold
    IBOutlet UIView *TapAndHoldView;            ///< This view is rotated after when a user tap and holds.
    IBOutlet UIView *TapAndHoldWithDelayView;   ///< This view is rotated after a short delay.
	NSTimer *TouchHoldTimer;                    ///< Main Timer
    NSInteger TouchAndHoldCounter;              ///< Used for informational purposes only.
    NSDate *FirstTouchTime;                     ///< Used for informational purposes only.

    // Double tap and hold
    IBOutlet UIView *DoubleTapAndHoldView;      ///< This view is rotated after a double tap and hold.
    NSInteger DoubleTapAndHoldCounter;          ///< Used for informational purposes only.
    NSDate *DoubleTapTime;                      ///< Used for informational purposes only.

    // Tracking All touches
    NSMutableArray *ActiveTouches;              ///< Used to keep track of all current touches.
    
    // Pinch and Zoom
    IBOutlet UIView *PinchAndStretchView;       ///< View to demo pinch and stretch.
    CGSize OriginalDifference;                  ///< Used for calulating the relative difference between two multi-taps for pinch/strech and zoom/unzoom
}

@end


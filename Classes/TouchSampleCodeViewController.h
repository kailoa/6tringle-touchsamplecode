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
    IBOutlet UIView *TapAndHoldView;
    IBOutlet UIView *TapAndHoldWithDelayView;
	NSTimer *TouchHoldTimer;            ///< Main Timer
    NSInteger TouchAndHoldCounter;      ///< Used for informational purposes only.
    NSDate *FirstTouchTime;             ///< Array of vertices to be pushed around by the user

    IBOutlet UIView *DoubleTapAndHoldView;
    NSInteger DoubleTapAndHoldCounter;
    NSDate *DoubleTapTime;
}

@end


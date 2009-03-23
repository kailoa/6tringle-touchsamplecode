//
//  TouchSampleCodeViewController.h
//  TouchSampleCode
//
//  Created by Kailoa Kadano on 2009/3/23.
//  Copyright 6Tringle LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroUtilities.h"

@interface TouchSampleCodeViewController : UIViewController 
{
    IBOutlet UILabel *TouchAndHoldLabel;
	NSTimer *TouchTimer;
    NSInteger TouchAndHoldCounter;
    NSDate *FirstTouchTime;
}

@end


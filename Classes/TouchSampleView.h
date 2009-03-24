/*********************************************************************
 *  \file TouchSampleView.h
 *  \author Kailoa Kadano
 *  \date 2009/3/23
 *  \class TouchSampleView
 *  \brief Part of TouchSampleCode
 *  \details
 *
 *  \abstract Simple UIView subclass that forwards touch events to the view controller for processing 
 *  \copyright Copyright 2009 6Tringle LLC. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "MacroUtilities.h"

@interface TouchSampleView : UIView {
    IBOutlet UIViewController *ViewController;
}


@end

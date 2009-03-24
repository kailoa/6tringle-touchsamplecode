/*********************************************************************
 *  \file TouchSampleCodeAppDelegate.h
 *  \author Kailoa Kadano
 *  \date 2009/3/23
 *  \class TouchSampleCodeAppDelegate
 *  \brief Part of TouchSampleCode
 *  \details
 *
 *  \abstract AppDelegate for TouchSampleCode 
 *  \copyright Copyright 2009 6Tringle LLC. All rights reserved.
 */


#import <UIKit/UIKit.h>

@class TouchSampleCodeViewController;

@interface TouchSampleCodeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchSampleCodeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TouchSampleCodeViewController *viewController;

@end


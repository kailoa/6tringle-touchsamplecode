/*********************************************************************
 *  \file TouchSampleCodeAppDelegate.m
 *  \author Kailoa Kadano
 *  \date 2009/3/23
 *  \class TouchSampleCodeAppDelegate
 *  \brief Part of TouchSampleCode
 *  \details
 *
 *  \abstract AppDelegate for TouchSampleCode 
 *  \copyright Copyright 2009 6Tringle LLC. All rights reserved.
 */

#import "TouchSampleCodeAppDelegate.h"
#import "TouchSampleCodeViewController.h"

@implementation TouchSampleCodeAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

//
//  TouchSampleCodeAppDelegate.m
//  TouchSampleCode
//
//  Created by Kailoa Kadano on 2009/3/23.
//  Copyright 6Tringle LLC 2009. All rights reserved.
//

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

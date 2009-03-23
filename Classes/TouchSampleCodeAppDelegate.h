//
//  TouchSampleCodeAppDelegate.h
//  TouchSampleCode
//
//  Created by Kailoa Kadano on 2009/3/23.
//  Copyright 6Tringle LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchSampleCodeViewController;

@interface TouchSampleCodeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchSampleCodeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TouchSampleCodeViewController *viewController;

@end


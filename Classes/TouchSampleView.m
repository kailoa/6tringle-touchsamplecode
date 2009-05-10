/*********************************************************************
 *  \file TouchSampleView.m
 *  \author Kailoa Kadano
 *  \date 2009/3/23
 *  \class TouchSampleView
 *  \brief Part of TouchSampleCode
 *  \details
 *
 *  \abstract Simple UIView subclass that forwards touch events to the view controller for processing 
 *  \copyright Copyright 2009 6Tringle LLC. All rights reserved.
 */

#import "TouchSampleView.h"


@interface TouchSampleView (private_interface)

@end

@implementation TouchSampleView

/*********************************************************************/
#pragma mark -
#pragma mark ** Methods **

- (void)dealloc {
    [super dealloc];
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Touch Handlers **

// For the purpose of this sample code, we are just forwarding all the touch 
// handlers to the view controller for processing. This is not normal and 
// actually breaks _some_ MVC patterns.  Conversely, in some apps, it makes 
// sense to compartmentalize touch handling with the controllers.

- (id)forwardingTargetForSelector:(SEL)sel
{
    NSString *sel_string = NSStringFromSelector(sel);
    if ([sel_string isEqualToString:@"touchesBegan:withEvent:"]
        || [sel_string isEqualToString:@"touchesMoved:withEvent:"]
        || [sel_string isEqualToString:@"touchesEnded:withEvent:"]
        || [sel_string isEqualToString:@"touchesCancelled:withEvent:"])
        return ViewController;
    else
        return (id)super;
}


//The above is roughly equivalent to the following "manual forwarding"
/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    [ViewController touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
    [ViewController touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{    
    [ViewController touchesEnded:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{
    [ViewController touchesCancelled:touches withEvent:event];
}
*/

@end

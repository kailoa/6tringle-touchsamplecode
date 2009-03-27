/*********************************************************************
 *  \file MacroUtilities.h
 *  \author Kailoa Kadano
 *  \date 2006/3/23
 *  \brief Part of TouchSampleCode
 *  \details
 *
 *  \abstract Miscellaneous convenience and utility macros and inline funcitons
 *  \copyright Copyright 2006-2009 6Tringle LLC. All rights reserved.
 */

#import <Foundation/Foundation.h>

#define NSYES [NSNumber numberWithBool:YES]
#define NSNO [NSNumber numberWithBool:NO]

#if !defined(DLOG)
#define DLOG(object)    (NSLog(@"" #object @" %d",object ));
#endif

#if !defined(FLOG)
#define FLOG(object)    (NSLog(@"" #object @" %f",object ));
#endif

#if !defined(OBJECT_LOG) //one argument
#define OBJECT_LOG(object)    (NSLog(@""  #object @" %@",[object description] ));
#endif

#if !defined(POINTLOG) //one argument
#define POINTLOG(point)    (NSLog(@""  #point @" x:%f y:%f", point.x, point.y ));
#endif

#if !defined(SIZELOG) //one argument
#define SIZELOG(size)    (NSLog(@""  #size @" width:%f height:%f", size.width, size.height ));
#endif

#if !defined(RECTLOG) //one argument
#define RECTLOG(rect)    (NSLog(@""  #rect @" x:%f y:%f w:%f h:%f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height ));
#endif

#if !defined(SELECTOR_LOG) //No arguments
#define SELECTOR_LOG    (NSLog(@"%@ in %s", NSStringFromSelector(_cmd), __FILE__));
#endif

#if !defined(METHOD_LOG) //No arguments
#define METHOD_LOG    (NSLog(@"%@ %s\n%@", NSStringFromSelector(_cmd), __FILE__, self))
#endif

#if !defined(METHOD_LOG_THREAD) //No arguments
#define METHOD_LOG_THREAD    (NSLog(@"%@ %@ %s\n%@", NSStringFromSelector(_cmd), [NSThread currentThread], __FILE__, self))
#endif

#if !defined(NOT_NIL_ASSERT) //one argument
#define NOT_NIL_ASSERT(x)    NSAssert4((x != nil), @"\n\n    ****  Unexpected Nil Assertion  ****\n    ****  " #x @" is nil.\nin file:%s at line %i in Method %@ with object:\n %@", __FILE__, __LINE__, NSStringFromSelector(_cmd), self)
#endif

#if !defined(ALWAYS_ASSERT) //No arguments
#define ALWAYS_ASSERT    NSAssert4(0, @"\n\n    ****  Unexpected Assertion  **** \nAssertion in file:%s at line %i in Method %@ with object:\n %@", __FILE__, __LINE__, NSStringFromSelector(_cmd), self)
#endif

#if !defined(MSG_ASSERT) //one argument
#define MSG_ASSERT(x)    NSAssert5(0, @"\n\n    ****  Unexpected Assertion  **** \nReason: %@\nAssertion in file:%s at line %i in Method %@ with object:\n %@", x, __FILE__, __LINE__, NSStringFromSelector(_cmd), self)
#endif

#if !defined(ASSERT_TRUE) //one argument, if the argument is false, raise the assert
#define ASSERT_TRUE(test)    NSAssert4(test, @"\n\n    ****  Unexpected Assertion  **** \nAssertion in file:%s at line %i in Method %@ with object:\n %@", __FILE__, __LINE__, NSStringFromSelector(_cmd), self)
#endif

#if !defined(MSG_ASSERT_TRUE) //two arguments, if the argument is false, raise the assert and display the message
#define MSG_ASSERT_TRUE(test, msg)    NSAssert5(test, @"\n\n    ****  Unexpected Assertion  **** \nReason: %@\nAssertion in file:%s at line %i in Method %@ with object:\n %@", msg, __FILE__, __LINE__, NSStringFromSelector(_cmd), self)
#endif

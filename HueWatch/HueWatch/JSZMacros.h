//
//  JSZMacros.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#ifndef HueWatch_JSZMacros_h
#define HueWatch_JSZMacros_h

// the NO if statement doesn't run but is a compiler check to test if the object containst the key
#define JSZKey(object, selector) ({ __typeof(object) testObject = nil; if (NO) { (void)((testObject).selector); } @#selector; })

#define JSZClass(className) NSStringFromClass([className class])
#define JSZSelector(selectorName) NSStringFromSelector(@selector(selectorName))
#define JSZBool(boolValue) (boolValue ? @"YES" : @"NO")

#define JSZWeakify(__var) \
__weak __typeof__(__var) __var ## _weak_ = (__var)

#define JSZStrongify(__var) \
_Pragma("clang diagnostic push"); \
_Pragma("clang diagnostic ignored  \"-Wshadow\""); \
__strong __typeof__(__var) __var = __var ## _weak_; \
_Pragma("clang diagnostic pop") \

//#define SINGLETON_GCD(classname)                     \
//\
//+ (instancetype)sharedInstance {                     \
//\
//static dispatch_once_t onceToken;                \
//static classname *sharedInstance = nil;          \
//dispatch_once(&onceToken, ^{                     \
//sharedInstance = [[self alloc] init];        \
//});                                              \
//return sharedInstance;                           \
//}

#endif

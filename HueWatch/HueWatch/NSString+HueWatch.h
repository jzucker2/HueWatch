//
//  NSString+HueWatch.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HueWatch)

+ (NSString *)jsz_stringByEncodingURLComponent:(NSString *)unencodedString;

@end

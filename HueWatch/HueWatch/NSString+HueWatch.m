//
//  NSString+HueWatch.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "NSString+HueWatch.h"

@implementation NSString (HueWatch)

+ (NSString *)stringByEncodingURLComponent:(NSString *)unencodedString {
    return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                        NULL,
                                                                        (__bridge CFStringRef)unencodedString,
                                                                        NULL,
                                                                        CFSTR("!*'();:@&=+$,/?%#[]\" "),
                                                                        kCFStringEncodingUTF8);
}

@end

//
//  NSURLSession+HueWatch.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSession (HueWatch)

- (NSURLSessionDataTask *)hueRequest:(NSString *)URLString parameters:(NSDictionary *)parameters response:(void (^)(id responseObject, NSError *error))response;

- (NSURLSessionDataTask *)huePUTRequest:(NSString *)URLString parameters:(NSDictionary *)parameters response:(void (^)(id responseObject, NSError *error))response;

@end

//
//  JSZHueSessionManager.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface JSZHueSessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

- (NSURLSessionDataTask *)helloWorldGet;

@end

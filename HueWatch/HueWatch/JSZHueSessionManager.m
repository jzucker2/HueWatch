//
//  JSZHueSessionManager.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "JSZHueSessionManager.h"

@implementation JSZHueSessionManager

+ (instancetype)sharedInstance {
    static JSZHueSessionManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *baseURLString = [NSString stringWithFormat:@"http://10.0.1.31"];
        
        sharedInstance = [[JSZHueSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
        //        sharedInstance.responseSerializer = [AFJSONResponseSerializer serializer];
        sharedInstance.responseSerializer = [AFHTTPResponseSerializer serializer];
//        sharedInstance.requestSerializer.timeoutInterval = 330;
    });
    
    return sharedInstance;
}

- (NSURLSessionDataTask *)helloWorldGet {
    NSString *urlString = @"/api/newdeveloper";
    return [self GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"task is %@", task);
        NSLog(@"responseObject is %@", responseObject);
        NSLog(@"responseObject: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        //        NSArray *responseArray = [NSKeyedUnarchiver unarchiveObjectWithData:responseObject];
        //        NSLog(@"responseArray is %@", responseArray);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"task is %@", task);
        NSLog(@"error is %@", error);
    }];
    
}

@end

//
//  NSURLSession+HueWatch.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^JSZResponseBlock)(id responseObject, NSError *error);

@interface NSURLSession (HueWatch)

- (NSURLSessionDataTask *)hueGET:(NSString *)URLString parameters:(NSDictionary *)parameters response:(JSZResponseBlock)responseBlock;

- (NSURLSessionDataTask *)huePUT:(NSString *)URLString body:(NSData *)body parameters:(NSDictionary *)parameters response:(JSZResponseBlock)responseBlock;
- (NSURLSessionDataTask *)huePOST:(NSString *)URLString body:(NSData *)body parameters:(NSDictionary *)parameters response:(JSZResponseBlock)responseBlock;

@end

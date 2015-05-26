//
//  NSURLSession+HueWatch.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <BLocksKit/BlocksKit.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

#import "NSURLSession+HueWatch.h"
#import "NSString+HueWatch.h"

static NSString * const kHueBaseURLString = @"http://10.0.1.31/api/";

@implementation NSURLSession (HueWatch)

- (NSMutableURLRequest *)hueRequestURLString:(NSString *)URLString parameters:(NSDictionary *)parameters body:(NSData *)body {
    NSString *allParametersString = @"?";
    BOOL notFirstIteration = NO;
    for (NSString *key in parameters.allKeys) {
        if (![allParametersString hasSuffix:@"&"] &&
            notFirstIteration) {
            allParametersString = [allParametersString stringByAppendingString:@"&"];
        }
        NSString *thisParameterString = [NSString stringWithFormat:@"%@=%@", [NSString jsz_stringByEncodingURLComponent:key], [NSString jsz_stringByEncodingURLComponent:parameters[key]]];
        allParametersString = [allParametersString stringByAppendingString:thisParameterString];
        notFirstIteration = YES;
    }
    // Remember to remove ? if no parameters
    NSString *finalURLString = [NSString stringWithFormat:@"%@%@", URLString, ([allParametersString isEqualToString:@"?"] ? @"": allParametersString)];
    NSURL *finalURL = [NSURL URLWithString:finalURLString relativeToURL:[NSURL URLWithString:kHueBaseURLString]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:finalURL];
    NSLog(@"request: %@", request);
    request.HTTPBody = body;
    return request;
}

- (NSURLSessionDataTask *)hueGET:(NSString *)URLString parameters:(NSDictionary *)parameters response:(JSZResponseBlock)responseBlock {
    NSMutableURLRequest *request = [self hueRequestURLString:URLString parameters:parameters body:nil];
    NSLog(@"request: %@", request);
    return [self dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"reponse: %@", response);
        if (error) {
            DDLogError(@"data task failed: %@", error);
            responseBlock(response, error);
            return;
        }
        id responseObject;
        if (data) {
            responseObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (error) {
                responseBlock(nil, error);
                return;
            }
        }
        responseBlock(responseObject, error);
    }];
}

- (NSURLSessionDataTask *)huePUT:(NSString *)URLString body:(NSData *)body parameters:(NSDictionary *)parameters response:(JSZResponseBlock)responseBlock {
    NSMutableURLRequest *request = [self hueRequestURLString:URLString parameters:parameters body:body];
    request.HTTPMethod = @"PUT";
    NSLog(@"request: %@", request);
    return [self dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"reponse: %@", response);
        if (error) {
            DDLogError(@"data task failed: %@", error);
            responseBlock(response, error);
            return;
        }
        id responseObject;
        if (data) {
            responseObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (error) {
                responseBlock(nil, error);
                return;
            }
        }
        responseBlock(responseObject, error);
    }];
}

- (NSURLSessionDataTask *)huePOST:(NSString *)URLString body:(NSData *)body parameters:(NSDictionary *)parameters response:(JSZResponseBlock)responseBlock {
    NSMutableURLRequest *request = [self hueRequestURLString:URLString parameters:parameters body:body];
    request.HTTPMethod = @"POST";
    NSLog(@"request: %@", request);
    return [self dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"reponse: %@", response);
        if (error) {
            DDLogError(@"data task failed: %@", error);
            responseBlock(response, error);
            return;
        }
        id responseObject;
        if (data) {
            responseObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (error) {
                responseBlock(nil, error);
                return;
            }
        }
        responseBlock(responseObject, error);
    }];
}

@end

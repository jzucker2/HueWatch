//
//  JSZHueManager.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <BlocksKit/BlocksKit.h>

#import "JSZMacros.h"
#import "JSZHueManager.h"
#import "NSURLSession+HueWatch.h"
#import "JSZHueLight.h"
#import "JSZHueState.h"

@interface JSZHueManager ()
@property (nonatomic, readwrite) NSMutableDictionary *lights;
@property (nonatomic) NSURLSession *hueSession;
@end

@implementation JSZHueManager

+ (instancetype)sharedInstance {
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _lights = [NSMutableDictionary dictionary];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        _hueSession = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (void)dealloc {
    [self.hueSession invalidateAndCancel];
}

- (void)searchForLights {
    NSURLSessionDataTask *searchForLightsTask = [self.hueSession hueGET:@"newdeveloper/lights" parameters:nil response:^(id responseObject, NSError *error) {
//        NSLog(@"responseObject: %@", responseObject);
//        NSLog(@"error: %@", error);
        NSAssert([responseObject isKindOfClass:[NSDictionary class]], @"Response object for all lights is not of class dictionary");
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSDictionary *lightsDictionary = [responseDict bk_map:^id(id key, id obj) {
            return [JSZHueLight hueLightWithJSON:obj];
        }];
        [self.lights addEntriesFromDictionary:lightsDictionary];
        
        
    }];
    [searchForLightsTask resume];
}

- (void)setState:(JSZHueState *)state forLight:(JSZHueLight *)light {
////    JSZWeakify(self);
//    NSString *key = [self.lights bk_match:^BOOL(id key, id obj) {
////        JSZStrongify(self);
//        JSZHueLight *checkingLight = (JSZHueLight *)obj;
//        return [checkingLight.uniqueID isEqualToString:light.uniqueID];
//    }];
    NSDictionary *lightAndValue = [self.lights bk_select:^BOOL(id key, id obj) {
        JSZHueLight *checkingLight = (JSZHueLight *)obj;
        return [checkingLight.uniqueID isEqualToString:light.uniqueID];
    }];
    NSAssert([lightAndValue.allKeys count] == 1, @"There should only be one matching light");
    NSString *lightStateString = [NSString stringWithFormat:@"newdeveloper/lights/%@/state", lightAndValue.allKeys.firstObject];
    NSData *bodyData = state.JSONData;
    NSURLSessionDataTask *stateForLightTask = [self.hueSession huePUT:lightStateString body:bodyData parameters:nil response:^(id responseObject, NSError *error) {
        NSLog(@"responseObject: %@", responseObject);
        NSLog(@"error: %@", error);
    }];
    [stateForLightTask resume];
}

@end

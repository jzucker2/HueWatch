//
//  JSZHueManager.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <BlocksKit/BlocksKit.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <Mantle/Mantle.h>

#import "JSZMacros.h"
#import "JSZHueManager.h"
#import "NSURLSession+HueWatch.h"
#import "JSZHueLight.h"
#import "JSZHueState.h"
//#import "JSZRequestHueState.h"
//#import "JSZResponseHueState.h"

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
    JSZWeakify(self);
    NSURLSessionDataTask *searchForLightsTask = [self.hueSession hueGET:@"newdeveloper/lights" parameters:nil response:^(id responseObject, NSError *error) {
        JSZStrongify(self);
//        NSLog(@"responseObject: %@", responseObject);
//        NSLog(@"error: %@", error);
        NSAssert([responseObject isKindOfClass:[NSDictionary class]], @"Response object for all lights is not of class dictionary");
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSDictionary *lightsDictionary = [responseDict bk_map:^id(id key, id obj) {
            NSError *lightError;
            JSZHueLight *light = [JSZHueLight hueLightWithJSON:obj error:&lightError];
            if (lightError) {
                NSLog(@"lightError: %@", lightError);
            }
            return light;
        }];
        [self.lights addEntriesFromDictionary:lightsDictionary];
        
        
        
    }];
    [searchForLightsTask resume];
}

- (void)setState:(JSZHueState *)state forLight:(JSZHueLight *)light {
    NSNumber *lightIndex = [self indexForLight:light];
    if (!lightIndex) {
        DDLogError(@"no index found for light: %@", light);
        return;
    }
    [self setState:state forLightIndex:[lightIndex unsignedIntegerValue]];
}

- (void)setState:(JSZHueState *)state forLightIndex:(NSUInteger)lightIndex {
    NSParameterAssert(state);
    NSParameterAssert((lightIndex > 0) &&
                      (lightIndex <= self.lights.allKeys.count));
    NSNumber *lightNumber = @(lightIndex);
    NSParameterAssert(self.lights[[lightNumber stringValue]]);
    NSString *lightStateString = [NSString stringWithFormat:@"newdeveloper/lights/%@/state", lightNumber];
    NSData *bodyData = state.JSONData;
    NSURLSessionDataTask *stateForLightTask = [self.hueSession huePUT:lightStateString body:bodyData parameters:nil response:^(id responseObject, NSError *error) {
//        NSLog(@"responseObject: %@", responseObject);
//        NSLog(@"error: %@", error);
        if ([responseObject isKindOfClass:[NSArray class]]) {
            for (NSDictionary *attributeResponseDictionary in responseObject) {
//                NSLog(@"dictionary: %@", attributeResponseDictionary);
                if (attributeResponseDictionary[@"success"]) {
                    JSZHueLight *light = self.lights[[lightNumber stringValue]];
                    JSZHueState *state = light.state;
//                    NSLog(@"state: %@", state);
                    NSDictionary *successDictionary = attributeResponseDictionary[@"success"];
//                    NSLog(@"item: %@", successDictionary);
                    for (NSString *pathKey in successDictionary) {
//                        NSLog(@"pathKey: %@", pathKey);
                        NSString *attribute = pathKey.lastPathComponent;
//                        NSLog(@"attribute: %@", attribute);
                        if ([attribute isEqualToString:@"on"]) {
                            
                        }
                    }
                }
            }
        }
    }];
    [stateForLightTask resume];
}

- (void)setName:(NSString *)name forLightIndex:(NSUInteger)lightIndex {
    NSParameterAssert(name);
    NSParameterAssert((lightIndex > 0) &&
                      (lightIndex <= self.lights.allKeys.count));
    NSNumber *lightNumber = @(lightIndex);
    NSParameterAssert(self.lights[[lightNumber stringValue]]);
    NSString *lightRenameString = [NSString stringWithFormat:@"newdeveloper/lights/%@", lightNumber];
    NSDictionary *renameDictionary = @{
                                       @"name" : name
                                       };
    NSData *bodyData = [NSJSONSerialization dataWithJSONObject:renameDictionary options:kNilOptions error:nil];
    NSURLSessionDataTask *renameTask = [self.hueSession huePUT:lightRenameString body:bodyData parameters:nil response:^(id responseObject, NSError *error) {
//        NSLog(@"responseObject: %@", responseObject);
//        NSLog(@"error: %@", error);
    }];
    [renameTask resume];
}

- (void)setName:(NSString *)name forLight:(JSZHueLight *)light {
    NSNumber *lightIndex = [self indexForLight:light];
    if (!lightIndex) {
        DDLogError(@"no index found for light: %@", light);
        return;
    }
    [self setName:name forLightIndex:[lightIndex unsignedIntegerValue]];
}

- (NSNumber *)indexForLight:(JSZHueLight *)light {
    NSDictionary *lightAndValue = [self.lights bk_select:^BOOL(id key, id obj) {
        JSZHueLight *checkingLight = (JSZHueLight *)obj;
        return [checkingLight.uniqueID isEqualToString:light.uniqueID];
    }];
    NSAssert([lightAndValue.allKeys count] == 1, @"There should only be one matching light");
    if (lightAndValue.allKeys.count == 0) {
        return nil;
    } else {
        
        return @([lightAndValue.allKeys.firstObject integerValue]);
    }
}

@end

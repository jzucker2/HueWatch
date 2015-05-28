//
//  JSZHueManager.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class JSZHueState;
@class JSZRequestHueState;
@class JSZHueLight;

@interface JSZHueManager : NSObject

@property (nonatomic, readonly) NSMutableDictionary *lights;

+ (instancetype)sharedInstance;

- (void)searchForLights;

- (void)setState:(JSZRequestHueState *)state forLight:(JSZHueLight *)light;
- (void)setState:(JSZRequestHueState *)state forLightIndex:(NSUInteger)lightIndex;
- (void)setName:(NSString *)name forLightIndex:(NSUInteger)lightIndex;
- (void)setName:(NSString *)name forLight:(JSZHueLight *)light;
- (NSNumber *)indexForLight:(JSZHueLight *)light;

@end

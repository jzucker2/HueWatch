//
//  JSZHueState.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSZHueLight;

@interface JSZHueState : NSObject

- (instancetype)initWithJSON:(NSDictionary *)dictionary;
+ (instancetype)hueStateWithJSON:(NSDictionary *)dictionary;

- (NSData *)JSONData;
- (NSDictionary *)JSONDict;

@property (nonatomic, weak) JSZHueLight *light;
@property (nonatomic, copy) NSNumber *hue;
@property (nonatomic, copy, getter=isOn) NSNumber *on;
@property (nonatomic, copy) NSNumber *brightness;
@property (nonatomic, copy) NSNumber *saturation;
@property (nonatomic, copy) NSNumber *colorTemperature;
@property (nonatomic, copy) NSString *alert;
@property (nonatomic, copy) NSString *effect;
@property (nonatomic) NSValue *xy;
//@property (nonatomic, copy) NSNumber
//@property (nonatomic, copy) NSString *softwareVersion;

@end

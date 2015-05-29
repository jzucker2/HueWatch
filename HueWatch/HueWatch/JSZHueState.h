//
//  JSZHueState.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@class JSZHueLight;

@interface JSZHueState : MTLModel <MTLJSONSerializing>

//- (instancetype)initWithJSON:(NSDictionary *)dictionary;
//+ (instancetype)hueStateWithJSON:(NSDictionary *)dictionary;
+ (instancetype)hueStateWithJSON:(NSDictionary *)dictionaryValue error:(NSError **)error;
//
- (NSData *)JSONData;
- (NSDictionary *)JSONDict;

//@property (nonatomic, weak) JSZHueLight *light;
@property (nonatomic, copy) NSNumber *hue;
@property (nonatomic, copy, getter=isOn) NSNumber *on;
@property (nonatomic, copy) NSNumber *brightness;
@property (nonatomic, copy) NSNumber *saturation;
@property (nonatomic, copy) NSNumber *colorTemperature;
@property (nonatomic, copy) NSString *alert;
@property (nonatomic, copy) NSString *effect;
@property (nonatomic) NSValue *xy;
//@property (nonatomic) uint16_t hue;
//@property (nonatomic, getter=isOn) BOOL *on;
//@property (nonatomic, copy) NSNumber *brightness;
//@property (nonatomic, copy) NSNumber *saturation;
//@property (nonatomic, copy) NSNumber *colorTemperature;
//@property (nonatomic, copy) NSString *alert;
//@property (nonatomic, copy) NSString *effect;
//@property (nonatomic) NSValue *xy;

@end

//
//  JSZHueState.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <Realm+JSON/RLMObject+JSON.h>

#import "JSZHueState.h"
//#import "JSZHueStateAdapter.h"

@interface JSZHueState ()
//@property (nonatomic, copy) NSNumber *hue;
//@property (nonatomic) BOOL on;
//@property (nonatomic) JSZHueStateAdapter *adapter;
@end

@implementation JSZHueState

//+ (instancetype)hueStateWithJSON:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error {
//    return [JSZHueState createOrUpdateInRealm:[RLMRealm defaultRealm] withJSONDictionary:dictionaryValue];
//}

+ (NSString *)primaryKey {
    return @"uniqueID";
}

//+ (NSDictionary *)JSONInboundMappingDictionary {
//    return @{
//             @"on": @"on",
//             @"bri": @"brightness",
//             @"hue": @"hue",
//             @"sat": @"saturation",
//             @"uniqueid": @"uniqueID",
//             @"ct": @"colorTemperature",
//             @"alert": @"alert",
//             @"effect" : @"effect",
//             @"reachable" : @"reachable"
//             };
//}

+ (NSDictionary *)defaultPropertyValues {
    return @{
             @"uniqueID" : [NSUUID UUID].UUIDString
             };
}

//- (instancetype)initWithJSON:(NSDictionary *)dictionary {
//    NSDictionary *initDict = dictionary;
//    // in case the original JSON response is passed in, instead of just the state dictionary
//    if (dictionary[@"state"]) {
//        initDict = dictionary[@"state"];
//    }
//    self = [super init];
//    if (self) {
//        _hue = initDict[@"hue"];
//        _on = initDict[@"on"];
//        NSArray *xyArray = initDict[@"xy"];
//        _xy = [NSValue valueWithCGPoint:CGPointMake([xyArray[0] floatValue], [xyArray[1] floatValue])];
//        _colorTemperature = initDict[@"ct"];
//        _alert = initDict[@"alert"];
//        _effect = initDict[@"effect"];
//        _brightness = initDict[@"bri"];
//    }
//    return self;
//}
//
//+ (instancetype)hueStateWithJSON:(NSDictionary *)dictionary {
//    return [[self alloc] initWithJSON:dictionary];
//}

//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        _adapter = [[JSZHueStateAdapter alloc] initWithModelClass:[self class]];
//    }
//    return self;
//}

//- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error {
//    self = [super initWithDictionary:dictionaryValue error:error];
//    if (self) {
//        _adapter = [[JSZHueStateAdapter alloc] initWithModelClass:[self class]];
//    }
//    return self;
//}

//+ (instancetype)hueStateWithJSON:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error {
////    return [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dictionaryValue error:error];
//}

//+ (NSDictionary *)JSONKeyPathsByPropertyKey {
//    // model_property_name : json_field_name
//    return @{
//             @"hue" : @"hue",
//             @"on" : @"on",
//             @"xy" : @"xy",
//             @"colorTemperature" : @"ct",
//             @"alert" : @"alert",
//             @"effect" : @"effect",
//             @"brightness" : @"bri"
//             };
//}

//- (NSDictionary *)JSONDict {
//    return [self.adapter JSONDictionaryFromModel:self error:nil];
//}
//
//- (NSData *)JSONData {
//    return [NSJSONSerialization dataWithJSONObject:self.JSONDict options:kNilOptions error:nil];
//}



//- (NSDictionary *)JSONDict {
//    NSMutableDictionary *JSONDict = [@{} mutableCopy];
//    if (self.hue) {
//        JSONDict[@"hue"] = self.hue;
//    }
//    if (self.on) {
//        JSONDict[@"on"] = self.on;
//    }
//    if (self.brightness) {
//        JSONDict[@"bri"] = self.brightness;
//    }
//    if (self.xy) {
//        CGPoint xyPoint = [self.xy CGPointValue];
//        JSONDict[@"xy"] = @[
//                            @(xyPoint.x),
//                            @(xyPoint.y)
//                            ];
//    }
//    if (self.alert) {
//        JSONDict[@"alert"] = self.alert;
//    }
//    if (self.saturation) {
//        JSONDict[@"sat"] = self.saturation;
//    }
//    if (self.colorTemperature) {
//        JSONDict[@"ct"] = self.colorTemperature;
//    }
//    if (self.effect) {
//        JSONDict[@"effect"] = self.effect;
//    }
//    return [JSONDict copy];
//}

//- (NSData *)JSONData {
//    NSJSONWritingOptions option;
//#if DEBUG
//    option = NSJSONWritingPrettyPrinted;
//#else
//    option = kNilOptions;
//#endif
//    return [NSJSONSerialization dataWithJSONObject:self.JSONDict options:option error:nil];
//}

@end

//
//  JSZHueLight.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "JSZHueLight.h"
#import "JSZResponseHueState.h"

@interface JSZHueLight ()
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, readwrite) JSZHueState *state;
@property (nonatomic, copy, readwrite) NSString *uniqueID;
@property (nonatomic, copy, readwrite) NSString *type;
@property (nonatomic, copy, readwrite) NSString *modelID;
@property (nonatomic, copy, readwrite) NSString *manufactureName;
@property (nonatomic, copy, readwrite) NSString *softwareVersion;
@property (nonatomic, readwrite) id pointsymbol;

@end

@implementation JSZHueLight

- (instancetype)initWithJSON:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _uniqueID = dictionary[@"uniqueid"];
        _state = [JSZResponseHueState hueStateWithJSON:dictionary[@"state"]];
        _state.light = self;
        _type = dictionary[@"type"];
        _modelID = dictionary[@"modelid"];
        _manufactureName = dictionary[@"manufacturername"];
        _softwareVersion = dictionary[@"swversion"];
        _pointsymbol = dictionary[@"pointsymbol"];
    }
    return self;
}

+ (instancetype)hueLightWithJSON:(NSDictionary *)dictionary {
    return [[self alloc] initWithJSON:dictionary];
}

@end

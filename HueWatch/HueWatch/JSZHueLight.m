//
//  JSZHueLight.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "JSZHueLight.h"
#import "JSZHueState.h"

@interface JSZHueLight ()
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, readwrite) JSZHueState *state;
@property (nonatomic, copy, readwrite) NSString *uniqueID;

@end

@implementation JSZHueLight

- (instancetype)initWithJSON:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _uniqueID = dictionary[@"uniqueid"];
        _state = [JSZHueState hueStateWithJSON:dictionary[@"state"]];
    }
    return self;
}

+ (instancetype)hueLightWithJSON:(NSDictionary *)dictionary {
    return [[self alloc] initWithJSON:dictionary];
}

@end

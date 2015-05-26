//
//  JSZHueState.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "JSZHueState.h"

@interface JSZHueState ()
//@property (nonatomic, copy) NSNumber *hue;
//@property (nonatomic) BOOL on;
@end

@implementation JSZHueState

- (instancetype)initWithJSON:(NSDictionary *)dictionary {
    NSDictionary *initDict = dictionary;
    if (dictionary[@"state"]) {
        initDict = dictionary[@"state"];
    }
    self = [super init];
    if (self) {
        _hue = initDict[@"hue"];
        _on = [initDict[@"on"] boolValue];
    }
    return self;
}

+ (instancetype)hueStateWithJSON:(NSDictionary *)dictionary {
    return [[self alloc] initWithJSON:dictionary];
}

- (NSDictionary *)JSONDict {
    NSMutableDictionary *JSONDict = [@{} mutableCopy];
    if (self.hue) {
        JSONDict[@"hue"] = self.hue;
    }
    return [JSONDict copy];
}

- (NSData *)JSONData {
    return [NSJSONSerialization dataWithJSONObject:self.JSONDict options:kNilOptions error:nil];
}

@end

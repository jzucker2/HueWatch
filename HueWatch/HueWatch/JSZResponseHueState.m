//
//  JSZResponseHueState.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/26/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "JSZResponseHueState.h"

@implementation JSZResponseHueState

//- (instancetype)initWithJSON:(NSDictionary *)dictionary {
//    // in case the original JSON response is passed in, instead of just the state dictionary
//    NSDictionary *initDict = dictionary;
//    if (dictionary[@"state"]) {
//        initDict = dictionary[@"state"];
//    }
//    self = [super initWithJSON:dictionary];
//    if (self) {
//        _reachable = initDict[@"reachable"];
//        _colorMode = initDict[@"colormode"];
//    }
//    return self;
//}
//
//+ (instancetype)hueStateWithJSON:(NSDictionary *)dictionary {
//    return [[self alloc] initWithJSON:dictionary];
//}
//
//- (NSDictionary *)JSONDict {
//    NSMutableDictionary *returningDict = [[super JSONDict] mutableCopy];
//    if (self.colorMode) {
//        returningDict[@"colormode"] = self.colorMode;
//    }
//    return [returningDict copy];
//}

@end

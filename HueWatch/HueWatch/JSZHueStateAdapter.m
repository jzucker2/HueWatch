//
//  JSZHueStateAdapter.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/29/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "JSZHueStateAdapter.h"
#import "JSZHueState.h"

@implementation JSZHueStateAdapter

- (NSSet *)serializablePropertyKeys:(NSSet *)propertyKeys forModel:(id<MTLJSONSerializing>)model {
//    NSSet *allPropertyKeys = [super serializablePropertyKeys:propertyKeys forModel:model];
    NSMutableSet *returningSet = [NSMutableSet set];
    JSZHueState *state = (JSZHueState *)model;
    for (NSString *key in propertyKeys) {
        NSLog(@"key: %@", key);
        if ([state valueForKey:key] != nil) {
            [returningSet addObject:key];
        }
    }

    return [returningSet copy];
}

@end

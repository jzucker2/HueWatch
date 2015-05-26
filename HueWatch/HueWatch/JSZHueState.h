//
//  JSZHueState.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSZHueState : NSObject

- (instancetype)initWithJSON:(NSDictionary *)dictionary;
+ (instancetype)hueStateWithJSON:(NSDictionary *)dictionary;

@end

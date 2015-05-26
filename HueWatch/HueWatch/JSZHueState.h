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

- (NSData *)JSONData;

@property (nonatomic, copy) NSNumber *hue;
@property (nonatomic, getter=isOn) BOOL on;

@end

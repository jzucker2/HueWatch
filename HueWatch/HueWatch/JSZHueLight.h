//
//  JSZHueLight.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@class JSZHueState;
@interface JSZHueLight : MTLModel <MTLJSONSerializing>

//- (instancetype)initWithJSON:(NSDictionary *)dictionary;
//+ (instancetype)hueLightWithJSON:(NSDictionary *)dictionary;
+ (instancetype)hueLightWithJSON:(NSDictionary *)dictionaryValue error:(NSError **)error;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) JSZHueState *state;
@property (nonatomic, copy, readonly) NSString *uniqueID;
@property (nonatomic, copy, readonly) NSString *type;
@property (nonatomic, copy, readonly) NSString *modelID;
@property (nonatomic, copy, readonly) NSString *manufacturerName;
@property (nonatomic, copy, readonly) NSString *softwareVersion;
@property (nonatomic, readonly) id pointsymbol;

@end

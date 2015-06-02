//
//  JSZHueLight.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@class JSZHueState;
@interface JSZHueLight : RLMObject

//- (instancetype)initWithJSON:(NSDictionary *)dictionary;
//+ (instancetype)hueLightWithJSON:(NSDictionary *)dictionary;
//+ (instancetype)hueLightWithJSON:(NSDictionary *)dictionaryValue error:(NSError **)error;

@property NSString *name;
@property JSZHueState *state;
@property NSString *uniqueID;
@property NSString *type;
@property NSString *modelID;
@property NSString *manufacturerName;
@property NSString *softwareVersion;
//@property id pointsymbol;

@end

//
//  JSZHueManager.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSZHueManager : NSObject

@property (nonatomic, readonly) NSMutableDictionary *lights;

+ (instancetype)sharedInstance;

- (void)searchForLights;

@end

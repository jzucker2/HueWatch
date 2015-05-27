//
//  JSZRequestHueState.h
//  HueWatch
//
//  Created by Jordan Zucker on 5/26/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "JSZHueState.h"

@interface JSZRequestHueState : JSZHueState

@property (nonatomic, copy) NSNumber *transitionTime;
@property (nonatomic, copy) NSNumber *brightnessIncrement;
@property (nonatomic, copy) NSNumber *saturationIncrement;
@property (nonatomic, copy) NSNumber *hueIncrement;
@property (nonatomic, copy) NSNumber *colorTemperatureIncrement;
@property (nonatomic, copy) NSNumber *xyIncrement;

@end

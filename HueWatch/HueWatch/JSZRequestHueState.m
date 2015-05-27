//
//  JSZRequestHueState.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/26/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "JSZRequestHueState.h"

@implementation JSZRequestHueState

- (NSDictionary *)JSONDict {
    NSMutableDictionary *returningDict = [[super JSONDict] mutableCopy];
    if (self.transitionTime) {
        returningDict[@"transitiontime"] = self.transitionTime;
    }
    if (self.brightnessIncrement &&
        !self.brightness) {
        returningDict[@"bri_inc"] = self.brightnessIncrement;
    }
    if (self.saturationIncrement &&
        !self.saturation) {
        returningDict[@"sat_inc"] = self.saturationIncrement;
    }
    if (self.hueIncrement &&
        !self.hue) {
        returningDict[@"hue_inc"] = self.hueIncrement;
    }
    if (self.colorTemperatureIncrement &&
        !self.colorTemperature) {
        returningDict[@"ct_inc"] = self.colorTemperatureIncrement;
    }
    if (self.xyIncrement &&
        !self.xy) {
        returningDict[@"xy_inc"] = self.xyIncrement;
    }
    return [returningDict copy];
}

@end

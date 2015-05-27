//
//  SecondViewController.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <BlocksKit/BlocksKit.h>

#import "SecondViewController.h"
#import "JSZHueManager.h"
#import "JSZHueLight.h"
#import "JSZHueState.h"
#import "JSZRequestHueState.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[JSZHueManager sharedInstance] searchForLights];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%@", [JSZHueManager sharedInstance].lights);
    NSDictionary *lights = [JSZHueManager sharedInstance].lights;
    NSDictionary *livingRoomLightAndKeyDict = [lights bk_select:^BOOL(id key, id obj) {
        JSZHueLight *light = (JSZHueLight *)obj;
        return [light.name isEqualToString:@"Living Room"];
    }];
    
//    JSZHueState *state = [[JSZHueState alloc] init];
//    state.on = @YES;
    JSZRequestHueState *state = [[JSZRequestHueState alloc] init];
    state.on = @YES;
    [[JSZHueManager sharedInstance] setState:state forLight:livingRoomLightAndKeyDict.allValues.firstObject];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

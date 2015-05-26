//
//  SecondViewController.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "SecondViewController.h"
#import "JSZHueManager.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

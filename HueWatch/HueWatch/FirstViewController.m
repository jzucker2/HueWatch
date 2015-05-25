//
//  FirstViewController.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic) NSURLSession *hueSession;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    self.hueSession = [NSURLSession sessionWithConfiguration:configuration];

}

- (void)dealloc {
    [self.hueSession invalidateAndCancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  FirstViewController.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "FirstViewController.h"
#import "JSZHueSessionManager.h"

@interface FirstViewController ()
@property (nonatomic) NSURLSession *hueSession;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//    self.hueSession = [NSURLSession sessionWithConfiguration:configuration];
//    NSURLSessionDataTask *task = [self.hueSession hueRequest:@"newdeveloper/lights" parameters:nil response:^(id responseObject, NSError *error) {
//        NSLog(@"responseObject: %@", responseObject);
//        NSLog(@"error: %@", error);
//    }];
//    [task resume];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
//    self.hueSession = [NSURLSession sessionWithConfiguration:configuration];
//    NSURLSessionDataTask *task = [self.hueSession hueRequest:@"newdeveloper/lights" parameters:nil response:^(id responseObject, NSError *error) {
//        NSLog(@"responseObject: %@", responseObject);
//        NSLog(@"error: %@", error);
//    }];
//    [task resume];
    [[JSZHueSessionManager sharedInstance] helloWorldGet];
}

- (void)dealloc {
    [self.hueSession invalidateAndCancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

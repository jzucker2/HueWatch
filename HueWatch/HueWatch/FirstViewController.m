//
//  FirstViewController.m
//  HueWatch
//
//  Created by Jordan Zucker on 5/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "FirstViewController.h"
#import "NSURLSession+HueWatch.h"

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
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    self.hueSession = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *task = [self.hueSession hueGET:@"newdeveloper/lights" parameters:nil response:^(id responseObject, NSError *error) {
        NSLog(@"responseObject: %@", responseObject);
        NSLog(@"error: %@", error);
    }];
    [task resume];
    
    NSURLSessionDataTask *task2 = [self.hueSession hueGET:@"newdeveloper/lights/2" parameters:nil response:^(id responseObject, NSError *error) {
        NSLog(@"responseObject: %@", responseObject);
        NSLog(@"error: %@", error);
    }];
    [task2 resume];
    
    NSData *lightStatePutData = [NSJSONSerialization dataWithJSONObject:@{@"on" : @YES} options:kNilOptions error:nil];
    NSURLSessionDataTask *task3 = [self.hueSession huePUT:@"newdeveloper/lights/2/state" body:lightStatePutData parameters:nil response:^(id responseObject, NSError *error) {
        NSLog(@"responseObject: %@", responseObject);
        NSLog(@"error: %@", error);
    }];
    [task3 resume];
    
//    NSURLSessionDataTask *task3 = [self.hueSession hueRequest:@"newdeveloper/lights/Living Room" parameters:nil response:^(id responseObject, NSError *error) {
//        NSLog(@"responseObject: %@", responseObject);
//        NSLog(@"error: %@", error);
//    }];
//    [task3 resume];
}

- (void)dealloc {
    [self.hueSession invalidateAndCancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

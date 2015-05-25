//
//  InterfaceController.m
//  HueWatch WatchKit Extension
//
//  Created by Jordan Zucker on 5/25/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *label;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [self.label setText:@"Aloha!"];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end




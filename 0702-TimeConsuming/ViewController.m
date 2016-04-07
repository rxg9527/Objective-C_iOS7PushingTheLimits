//
//  ViewController.m
//  0702-TimeConsuming
//
//  Created by Yuen on 16/4/8.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController

- (void)somethingTimeConsuming {
    [NSThread sleepForTimeInterval:5];
}

- (IBAction)doSomething:(UIButton *)btn {
    btn.enabled = NO;
    [self.activityIndicator startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self somethingTimeConsuming];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicator stopAnimating];
            btn.enabled = YES;
        });
    });
}

@end

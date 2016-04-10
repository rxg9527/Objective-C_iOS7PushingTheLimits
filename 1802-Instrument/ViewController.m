//
//  ViewController.m
//  1802-Instrument
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"
#import "ZipTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Lorem"
                                           ofType:@"txt"];
    
    ZipTextView *ztView = [[ZipTextView alloc] initWithFrame:self.view.bounds
                                                        text:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]];
    [self.view addSubview:ztView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end

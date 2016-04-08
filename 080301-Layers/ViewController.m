//
//  ViewController.m
//  080301-Layers
//
//  Created by Yuen on 16/4/8.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"pushing"];
    self.view.layer.contentsScale = [UIScreen mainScreen].scale;
    self.view.layer.contentsGravity = kCAGravityCenter; // 类似于contentMode
    self.view.layer.contents = (id)image.CGImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

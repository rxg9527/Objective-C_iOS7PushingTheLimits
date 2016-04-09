//
//  ViewController.m
//  0806-Decoration
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.cornerRadius = 10;
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.borderColor = [UIColor blueColor].CGColor;
    layer.borderWidth = 2;
    layer.shadowOpacity = 0.5;
    layer.shadowOffset = CGSizeMake(3.0, 3.0);
    [self.view.layer addSublayer:layer];
    
    layer = [CALayer layer];
    layer.frame = CGRectMake(150, 150, 100, 100);
    layer.cornerRadius = 10;
    layer.backgroundColor = [[UIColor greenColor] CGColor];
    layer.borderWidth = 2;
    layer.shadowOpacity = 0.5;
    layer.shadowOffset = CGSizeMake(3.0, 3.0);
    [self.view.layer addSublayer:layer];

}

@end

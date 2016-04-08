//
//  ViewController.m
//  0804-LayerAnimation
//
//  Created by Yuen on 16/4/8.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *squareLayer;
@property (nonatomic, strong) UIView *squareView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.squareLayer = [CALayer layer];
    self.squareLayer.backgroundColor = [UIColor redColor].CGColor;
    self.squareLayer.frame = CGRectMake(100, 100, 20, 20);
    [self.view.layer addSublayer:self.squareLayer];

    self.squareView = [UIView new];
    self.squareView.backgroundColor = [UIColor blueColor];
    self.squareView.frame = CGRectMake(200, 100, 20, 20);
    [self.view addSubview:self.squareView];

    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(drop:)]];
}

- (void)drop:(UIGestureRecognizer *)recognizer {
    /**
     *  禁用动作来阻止动画
     */
//    [CATransaction setDisableActions:YES];
    
    /**
     *  更改当前事务，从而修改动画属性
     */
    [CATransaction setAnimationDuration:2.0];

    /**
     *  图层动画持续稍大于1/4秒
     */
    self.squareLayer.position = CGPointMake(200, 250);
    self.squareView.center = CGPointMake(100, 250);
}

@end

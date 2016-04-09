//
//  ViewController.m
//  0807-Action
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"
#import "CircleLayer.h"

@interface ViewController ()

@property (nonatomic, strong) CircleLayer *circleLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.circleLayer = [CircleLayer new];
    self.circleLayer.radius = 20;
    self.circleLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:self.circleLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 2;
    
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue = @0.4;
    fadeAnimation.toValue = @1.0;
    
    CABasicAnimation *growAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    growAnimation.fromValue = @0.8;
    growAnimation.toValue = @1.0;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[fadeAnimation, growAnimation];
    
    NSMutableDictionary *actions = self.circleLayer.actions.mutableCopy;
    actions[@"position"] = animation;
    actions[kCAOnOrderIn] = animationGroup;
    self.circleLayer.actions = actions;

    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
}

- (void)tap:(UIGestureRecognizer *)tap {
    self.circleLayer.position = CGPointMake(100, 100);
    [CATransaction setAnimationDuration:2];
    self.circleLayer.radius = 100.0;
}

@end

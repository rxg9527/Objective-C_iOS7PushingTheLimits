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

    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fade:)]];
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
     *  基本的显式动画 CABasicAnimation
     动画有它的(key)关键帧、(fromValue)起始值、(toValue)目标值、(timingFunction)时间函数、(duration)持续时间等。它的工作原理是创建图层的多个副本，然后把它们显示出来。
     */
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = @1.0;
    anim.toValue = @0.0;
    anim.autoreverses = YES;
    anim.repeatCount = INFINITY;
    anim.duration = 2.0;
    [self.squareLayer addAnimation:anim forKey:@"anim"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.squareLayer removeAllAnimations];
    });
    
    /**
     *  图层默认动画持续稍大于1/4秒
     */
    self.squareLayer.position = CGPointMake(200, 250);
    self.squareView.center = CGPointMake(100, 250);
}

- (void)fade:(UITapGestureRecognizer *)g {
    CABasicAnimation *fade = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fade.fromValue = @1.0;
    fade.toValue = @0.0;
    fade.duration = 1;
    [self.squareLayer addAnimation:fade forKey:@"fade"];
}

@end

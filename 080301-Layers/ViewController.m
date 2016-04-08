//
//  ViewController.m
//  080301-Layers
//
//  Created by Yuen on 16/4/8.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"
#import "DelegateView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     *  直接设置图层CALayer的contents
     */
    UIImage *image = [UIImage imageNamed:@"pushing"];
    self.view.layer.contentsScale = [UIScreen mainScreen].scale;
    self.view.layer.contentsGravity = kCAGravityCenter; // 类似于contentMode
    self.view.layer.contents = (id)image.CGImage;
    
    UIGestureRecognizer *g;
    g = [[UITapGestureRecognizer alloc]
         initWithTarget:self
         action:@selector(performFlip:)];
    [self.view addGestureRecognizer:g];
}

- (void)performFlip:(UIGestureRecognizer *)recognizer {
    UIView *delegateView = [[DelegateView alloc] initWithFrame:self.view.frame];
    [UIView transitionFromView:self.view toView:delegateView duration:1 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
}

@end

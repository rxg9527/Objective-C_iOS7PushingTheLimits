//
//  CALayer+RNAnimation.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "CALayer+RNAnimation.h"
#import "../../../../../../Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSKeyValueCoding.h"

@implementation CALayer (RNAnimation)
- (void)setValue:(id)value
      forKeyPath:(NSString *)keyPath
        duration:(CFTimeInterval)duration
           delay:(CFTimeInterval)delay {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [self setValue:value forKeyPath:keyPath];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.duration = duration;
    animation.beginTime = CACurrentMediaTime() + delay;
    animation.fillMode = kCAFillModeBoth;
    animation.fromValue = [[self presentationLayer] valueForKey:keyPath];
    animation.toValue = value;
    [self addAnimation:animation forKey:keyPath];

    [CATransaction commit];
}


@end

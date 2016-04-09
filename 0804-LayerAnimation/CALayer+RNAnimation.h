//
//  CALayer+RNAnimation.h
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (RNAnimation)

- (void)setValue:(id)value
      forKeyPath:(NSString *)keyPath
         duration:(CFTimeInterval)duration
            delay:(CFTimeInterval)delay;

@end

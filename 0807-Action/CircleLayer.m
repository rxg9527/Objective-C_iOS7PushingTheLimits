//
//  CircleLayer.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "CircleLayer.h"
#import <UIKit/UIKit.h>

@implementation CircleLayer
@dynamic radius;

- (instancetype)init {
    if (self = [super init]) {
        [self setNeedsDisplay];
    }
    return self;
}

/**
 *  
 iOS自定义动画属性
 属性需标记为 @dynamic    
 重写 CALayer 的 + (BOOL)needsDisplayForKey:(NSString *)key方法，将需要动画的属性返回 YES，当为属性赋值时，会调用 display() 方法。
 重写 - (id<CAAction>)actionForKey:(NSString *)event 方法， 返回所需的动画。
 重写 - (void)drawInContext:(CGContextRef)ctx方法进行绘制。
 由于display() 方法会触发- (void)drawInContext:(CGContextRef)ctx方法，所以绘制的过程可以写在这两个方法中。
 */
- (void)drawInContext:(CGContextRef)ctx {
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGFloat radius = self.radius;
    CGRect rect = CGRectMake((self.bounds.size.width - radius) / 2, (self.bounds.size.height - radius) / 2, radius, radius);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextFillPath(ctx);
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"radius"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id <CAAction>)actionForKey:(NSString *)event {
    if ([self presentationLayer] != nil) {
        if ([event isEqualToString:@"radius"]) {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"radius"];
            animation.fromValue = [[self presentationLayer] valueForKey:@"radius"];
            return animation;
        }
    }

    return [super actionForKey:event];
}

@end

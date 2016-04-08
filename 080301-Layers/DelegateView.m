//
//  DelegateView.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/8.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "DelegateView.h"

@implementation DelegateView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.layer setNeedsDisplay];
        self.layer.contentsScale = [UIScreen mainScreen].scale;
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    UIGraphicsPushContext(ctx);
    [[UIColor colorWithWhite:0.95 alpha:1] set];
    UIRectFill(layer.bounds);
    
    /**
     *  
     在 iOS7 之后我们可以用 UIFont 的 preferredFontForTextStyle: 类方法来指定一个样式，并让字体大小符合用户在『设置』程序中设定的字体大小
     tips：UIFontTextStyle会默认对应一个字号，不同的UIFontTextStyle默认的初始字号不同。
     */
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    
    
    
}

@end

//
//  ZipTextView.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ZipTextView.h"
#import "RNTimer.h"

#if REVISION == 1

static const CGFloat kFontSize = 16.0;

@interface ZipTextView ()

@property (nonatomic) NSUInteger index;
@property (nonatomic) RNTimer *timer;
@property (nonatomic) NSString *text;

@end

@implementation ZipTextView

- (id)initWithFrame:(CGRect)frame text:(NSString *)text {
    if (self = [super initWithFrame:frame]) {
        WEAK_SELF;
        _timer = [RNTimer repeatingTimerWithTimeInterval:0.01
                                                   block:^{
                                                       [weakSelf appendNextCharacter];
                                                   }];
        _text = [text copy];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)appendNextCharacter {
    for (NSUInteger i = 0; i <= self.index; i++) {
        if (i < self.text.length) {
            UILabel *label = [UILabel new];
            label.text = [self.text substringWithRange:NSMakeRange(i, 1)];
            label.opaque = NO;
            [label sizeToFit];
            CGRect frame = label.frame;
            frame.origin = [self originAtIndex:i
                                      fontSize:label.font.pointSize];
            label.frame = frame;
            [self addSubview:label];
        }
    }
    self.index++;
}

/**
 *  递归
 */
- (CGPoint)originAtIndex:(NSUInteger)index
                fontSize:(CGFloat)fontSize {
    if (index == 0) {
        return CGPointZero;
    } else {
        CGPoint origin = [self originAtIndex:index - 1 fontSize:fontSize];
        NSString *previousCharacter = [self.text substringWithRange:NSMakeRange(index-1, 1)];
        CGSize previousCharacterSize = [previousCharacter sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
        origin.x += previousCharacterSize.width;
        if (origin.x > CGRectGetWidth(self.bounds)) {
            origin.x = 0;
            origin.y += previousCharacterSize.height;
        }
        return origin;
    }
}

@end

#endif
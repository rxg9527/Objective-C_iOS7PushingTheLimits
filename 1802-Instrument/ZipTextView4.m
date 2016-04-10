//
//  ZipTextView.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ZipTextView.h"
#import "RNTimer.h"

#if REVISION == 4

static const CGFloat kFontSize = 16.0;

@interface ZipTextView ()

@property (nonatomic) NSUInteger index;
@property (nonatomic) RNTimer *timer;
@property (nonatomic) NSString *text;
@property (nonatomic) NSMutableArray *locations;

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
        _locations = [NSMutableArray arrayWithObject:[NSValue valueWithCGPoint:CGPointZero]];
    }
    return self;
}

- (void)appendNextCharacter {
    self.index++;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    for (NSUInteger i = 0; i <= self.index; i++) {
        if (i < self.text.length) {
            NSString *character = [self.text substringWithRange:NSMakeRange(i, 1)];
            CGPoint origin = [self originAtIndex:i fontSize:kFontSize];
            [character drawAtPoint:origin withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kFontSize]}];
        }
    }
}

/**
 *  递归
 */
- (CGPoint)originAtIndex:(NSUInteger)index
                fontSize:(CGFloat)fontSize {
    if ([self.locations count] > index) {
        return [self.locations[index] CGPointValue];
    } else {
        CGPoint origin = [self originAtIndex:index - 1 fontSize:fontSize];
        NSString *previousCharacter = [self.text substringWithRange:NSMakeRange(index-1, 1)];
        CGSize previousCharacterSize = [previousCharacter sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
        origin.x += previousCharacterSize.width;
        if (origin.x > CGRectGetWidth(self.bounds)) {
            origin.x = 0;
            origin.y += previousCharacterSize.height;
        }
        /**
         *  缓存计算结果
         */
        self.locations[index] = [NSValue valueWithCGPoint:origin];
        return origin;
    }
}

@end

#endif
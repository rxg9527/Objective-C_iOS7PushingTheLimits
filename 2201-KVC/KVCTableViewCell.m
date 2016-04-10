//
//  KVCTableViewCell.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "KVCTableViewCell.h"

@implementation KVCTableViewCell

- (BOOL)isReady {
    // 显示配置好的东西
    return (self.object && [self.property length] > 0);
}

- (void)update {
    NSString *text;
    if ([self isReady]) {
        // 从目标获取属性值，属性名通过 self.property 给出。
        // 然后把值转换成可读的字符串
        id value = [self.object valueForKeyPath:self.property];
        text = [value description];
    } else {
        text = @"";
    }
    self.textLabel.text = text;
}

- (instancetype)initWithReuseIdentifier:(NSString *)identifier {
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
}

- (void)setObject:(id)anObject {
    _object = anObject;
    [self update];
}

- (void)setProperty:(NSString *)aProperty {
    _property = aProperty;
    [self update];
}

@end

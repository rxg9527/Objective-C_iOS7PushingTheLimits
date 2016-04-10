//
//  TwoTimesArray.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "TwoTimesArray.h"

@interface TwoTimesArray ()

@property (nonatomic, assign) NSUInteger count;

@end

@implementation TwoTimesArray

- (void)incrementCount {
    self.count++;
}

- (NSUInteger)countOfNumbers {
    return self.count;
}

- (id)objectInNumbersAtIndex:(NSUInteger)index {
    return @(index * 2);
}

@end

//
//  main.m
//  220107-KVC_容器操作符
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  output
         11
         这种操作符比等价的循环写法快，因为它们优化为数据库查询操作
         */
        NSArray *nsArray = @[@"one", @"two", @"three"];
        NSUInteger totalLengths = [[nsArray valueForKeyPath:@"@sum.length"] integerValue];
        NSLog(@"%@", @(totalLengths));
    }
    return 0;
}

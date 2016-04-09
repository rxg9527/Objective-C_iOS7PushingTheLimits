//
//  main.m
//  1007-CoreFoundation_TollFree
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PrintFunction() printf("\n%s():\n", __FUNCTION__);

static void testTollFree() {
    PrintFunction();
    NSArray *nsArray = @[@"Foo"];
    CFIndex count = CFArrayGetCount((CFArrayRef)nsArray);
    /**
     *  output
     count=1 1
     iOS7 中不需要使用__bridge修饰符
     */
    printf("count=%lu %ld\n", count, CFArrayGetCount((__bridge CFArrayRef)nsArray));
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testTollFree();
    }
    return 0;
}

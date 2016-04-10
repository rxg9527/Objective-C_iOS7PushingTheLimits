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

static void testTollFreeReverse() {
    PrintFunction();
    CFMutableArrayRef cfArray = CFArrayCreateMutable(NULL, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(cfArray, CFSTR("FOO"));
    /**
     *  output
     1
     这里需要用__bridge 转换。现在不是把 cfArray 传给一个检查过的函数，而是将其转换成一个 id 对象并向它发送一个消息
     */
    NSLog(@"%ld", [(__bridge id)cfArray count]);
    CFRelease(cfArray);
}

static void testTreeInArray() {
    PrintFunction();
    //TODO: 自由桥接
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testTollFree();
        testTollFreeReverse();
    }
    return 0;
}

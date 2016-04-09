//
//  main.m
//  1004-CoreFoundation_Introspection
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>

// Static可以用作函数和变量的前缀，对于函数来讲，static的作用仅限于隐藏
static void testIntrospection() {
    CFStringRef string = CFSTR("Hello");
    CFArrayRef array = CFArrayCreate(NULL, (const void**)&string, 1, &kCFTypeArrayCallBacks);
    /*
     (
     Hello
     )
     */
    CFShow(array);
    CFShow(string); // output: Hello
    /*
     Length 5
     IsEightBit 1
     HasLengthByte 0
     HasNullByte 1
     InlineContents 0
     Allocator SystemDefault
     Mutable 0
     Contents 0x100000f90
     */
    CFShowStr(string);
//    CFRelease(string); // CFSTR 名字中既没有 Create 也没有 Copy，就不需要在结果上调用CFRelease了
    CFRelease(array);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        testIntrospection();
    }
    return 0;
}

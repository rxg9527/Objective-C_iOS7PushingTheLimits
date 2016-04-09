//
//  main.m
//  1005-CoreFoundation
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>

#define PrintFunction() printf("\n%s():\n", __FUNCTION__);

#pragma mark - Creating Strings
static void testCString() {
    /**
     *  output
     testCString():
     Hello World!
     */
    PrintFunction();
    const char *cstring = "Hello World!";
    CFStringRef string = CFStringCreateWithCString(NULL, cstring, kCFStringEncodingUTF8);
    CFShow(string);
    CFRelease(string);
}

static void testPascalString() {
    /**
     *  output
     testPascalString():
     Text
     */
    PrintFunction();
    // A common type of network buffer
    struct NetworkBuffer {
        UInt8 length;
        UInt8 data[];
    };
    
    // Some data we pulled off of the network into the buffer
    static struct NetworkBuffer buffer = {
        4, {'T', 'e', 'x', 't'}};
    
    CFStringRef string = CFStringCreateWithPascalString(NULL,
                                                        (ConstStr255Param)&buffer,
                                                        kCFStringEncodingUTF8);
    CFShow(string);
    CFRelease(string);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testCString();
        testPascalString();
    }
    return 0;
}

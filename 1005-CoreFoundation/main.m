//
//  main.m
//  1005-CoreFoundation
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import "MYStringConversion.h"

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

#pragma mark - Converting to C strings
static void testCopyUTF8String() {
    PrintFunction();
    CFStringRef string = CFSTR("Hello");
    char * cstring = MYCFStringCopyUTF8String(string);
    printf("%s\n", cstring);
    free(cstring);
}

static void testGetUTF8String() {
    PrintFunction();
    CFStringRef strings[3] = { CFSTR("One"), CFSTR("Two"), CFSTR("Three") };
    char * buffer = NULL;
    const char * cstring = NULL;
    
    for (unsigned i = 0; i < 3; ++i) {
        cstring = MYCFStringGetUTF8String(strings[i], &buffer);
        printf("%s\n", cstring);
    }
    
    free(buffer);
}

static void testFastUTF8Conversion() {
    PrintFunction();
    CFStringRef string = CFSTR("Hello");
    
    const CFIndex kBufferSize = 1024;
    char buffer[kBufferSize];
    CFStringEncoding encoding = kCFStringEncodingUTF8;
    const char *cstring;
    cstring = CFStringGetCStringPtr(string, encoding);
    if (cstring == NULL) {
        if (CFStringGetCString(string, buffer, kBufferSize, encoding)) {
            cstring = buffer;
        }
    }
    
    printf("%s\n", cstring);
}

#pragma mark - String Backing Storage
static void testBytesNoCopy() {
    PrintFunction();
    const char *cstr = "Hello";
    char *bytes = CFAllocatorAllocate(kCFAllocatorDefault,
                                      strlen(cstr) + 1, 0);
    strcpy(bytes, cstr);
    CFStringRef str = CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, bytes,
                                                      kCFStringEncodingUTF8,
                                                      kCFAllocatorDefault);
    CFShow(str);
    CFRelease(str);
}

static void testBytesNoCopyMalloc() {
    PrintFunction();
    const char *cstr = "Hello";
    char *bytes = malloc(strlen(cstr) + 1);
    strcpy(bytes, cstr);
    CFStringRef str =
    CFStringCreateWithCStringNoCopy(NULL, bytes, kCFStringEncodingUTF8,
                                    kCFAllocatorMalloc);
    
    CFShow(str);
    
    CFRelease(str);
}

static void testBytesNoCopyNull() {
    PrintFunction();
    const char *cstr = "Hello";
    char *bytes = malloc(strlen(cstr) + 1);
    strcpy(bytes, cstr);
    CFStringRef str =
    CFStringCreateWithCStringNoCopy(NULL, bytes, kCFStringEncodingUTF8,
                                    kCFAllocatorNull);
    CFShow(str);
    CFRelease(str);
    
    // It's still safe to access bytes here, but not str
    printf("%s\n", bytes);
    
    free(bytes);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testCString();
        testPascalString();
        testCopyUTF8String();
        testGetUTF8String();
        testFastUTF8Conversion();
    }
    return 0;
}

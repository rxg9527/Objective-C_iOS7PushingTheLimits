//
//  main.m
//  03-NSArray_firstObject
//
//  Created by Yuen-iMac on 16/4/7.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *array = @[];
//        NSLog(@"%@", array[0]);
        NSLog(@"%@", [array firstObject]);
    }
    return 0;
}

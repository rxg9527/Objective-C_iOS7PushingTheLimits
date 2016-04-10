//
//  main.m
//  220106-KVC_HIgherOrderMessaging
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  output
         (
         One,
         Two,
         Three
         )
         */
        NSArray *nsArray = @[@"one", @"two", @"three"];
        NSArray *capitals = [nsArray valueForKey:@"capitalizedString"];
        NSLog(@"%@", capitals);
        
        /**
         *  output
         (
         3,
         3,
         5
         )
         */
        NSArray *capitalLengths = [nsArray valueForKeyPath:@"capitalizedString.length"];
        NSLog(@"%@", capitalLengths);
    }
    return 0;
}

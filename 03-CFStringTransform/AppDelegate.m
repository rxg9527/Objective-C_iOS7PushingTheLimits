//
//  AppDelegate.m
//  03-CFStringTransform
//
//  Created by Yuen-iMac on 16/4/3.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**
     *  创建可变字符串
     *
     *  @param maxLength - if not 0, is a hard bound on the length of the string. If 0, there is no limit on the length.
     */
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, CFSTR("Schläger"));
    /* Perform string transliteration.  The transformation represented by transform is applied to the given range of string, modifying it in place. Only the specified range will be modified, but the transform may look at portions of the string outside that range for context. 
     NULL range pointer causes the whole string to be transformed. On return, range is modified to reflect the new range corresponding to the original range. 
     reverse indicates that the inverse transform should be used instead, if it exists. 
     If the transform is successful, true is returned; if unsuccessful, false. Reasons for the transform being unsuccessful include an invalid transform identifier, or attempting to reverse an irreversible transform.
     */
    Boolean isSuccessful = CFStringTransform(string, NULL, kCFStringTransformStripCombiningMarks, false);
    /**
     *  output
     2016-04-07 14:47:01.482 03-CFStringTransform[791:12881] 1 Schlager
     */
    NSLog(@"%d %@", isSuccessful, string);
    CFRelease(string);
    
    
    
    /**
     *  处理非拉丁书写系统
     *  output
     2016-04-07 14:47:01.615 03-CFStringTransform[791:12881] 1 rén xíng guài
     2016-04-07 14:47:01.616 03-CFStringTransform[791:12881] 1 ren xing guai
     */
    string = CFStringCreateMutableCopy(NULL, 0, CFSTR("人形怪"));
    isSuccessful = CFStringTransform(string, NULL, kCFStringTransformToLatin, false);
    NSLog(@"%d %@", isSuccessful, string);
    isSuccessful = CFStringTransform(string, NULL, kCFStringTransformStripCombiningMarks, false);
    NSLog(@"%d %@", isSuccessful, string);

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  AppDelegate.m
//  03-NSURLComponents
//
//  Created by Yuen-iMac on 16/4/2.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *URLString = @"http://www.baidu.com";
    NSURLComponents *components = [NSURLComponents componentsWithString:URLString];
    NSString *host = components.host;
    NSLog(@"%@", host);
    components.host = @"www.jianshu.com";
    /**
     *
     @property (nullable, copy) NSString *scheme; // Attempting to set the scheme with an invalid scheme string will cause an exception.
     @property (nullable, copy) NSString *user;
     @property (nullable, copy) NSString *password;
     @property (nullable, copy) NSString *host;
     @property (nullable, copy) NSNumber *port; // Attempting to set a negative port number will cause an exception.
     @property (nullable, copy) NSString *path;
     @property (nullable, copy) NSString *query;
     @property (nullable, copy) NSString *fragment;
     */
    NSURL *jsURL = [components URL];
    NSLog(@"%@", jsURL);
    
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

//
//  AppDelegate.m
//  k3
//
//  Created by amttgroup on 16/2/16.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _documentDirectory = dir;
    NSLog(@"  _documentDirectory  %@",_documentDirectory);
    _borderColor = [UIColor colorWithRed:214.0/255.0 green:214.0/255.0  blue:214.0/255.0  alpha:1.0];
    _bgColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0  blue:238.0/255.0  alpha:1.0];
    _isEntry = YES;
    
    [NSThread sleepForTimeInterval:1.0f];//设置启动页面时间
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
    if (_isSetAppPwd) {
        [_mainV toScanPwdPage];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
//
//  AppDelegate.m
//  Scooter2018
//
//  Created by Egor on 16.01.18.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "AppDelegate.h"
#import "YKParentClass.h"
#import "YKChildClass.h"
#import "YKBoxer.h"
#import "YKTest.h"
#import "YKObject.h"
#import "YKHomeWork.h"
#import "YKHomeWork6.h"
#import "YKHomeWork7.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [YKTest videoTest1];
//    [YKTest videoTest2];
//    [YKTest videoTest3];
//    [YKTest testArray];
//    [YKHomeWork homeWork1V5];
//    [YKTest testDataTypes];
//    [YKHomeWork6 homeWork6];
//    [YKTest testProtocols];
    [YKHomeWork7 homeWork7];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

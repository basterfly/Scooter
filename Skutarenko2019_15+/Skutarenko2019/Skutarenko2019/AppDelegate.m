//
//  AppDelegate.m
//  Skutarenko2019
//
//  Created by Egor Kozlovskiy on 1/21/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import "AppDelegate.h"
#import "YKBitsTests.h"
#import "YKStudentHw.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    TESTS
    YKBitsTests *tests = [YKBitsTests new];
    [tests bitsTests];
    
    
//    Homework
    NSLog(@"~~~Homework~~~");
    
    NSMutableArray *students = [[NSMutableArray alloc] init];
    for (int index = 1; index <= 10; index++) {
        YKStudentHW *studentHw = [[YKStudentHW alloc] init];
        studentHw.name = [NSString stringWithFormat:@"Student%d", index];
        studentHw.typeOfClass = arc4random_uniform(256);
        [students addObject:studentHw];
    }
    
    for (YKStudentHW *studentHw in students) {
        NSLog(@"%@", studentHw);
    }
    
    
    
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

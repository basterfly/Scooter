//
//  AppDelegate.m
//  Skutarenko16NSDate
//
//  Created by Egor Kozlovskiy on 2/17/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import "AppDelegate.h"
#import "YKStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSMutableArray *mutableStudents = [[NSMutableArray alloc] init];
    NSDate *toDay = [NSDate date];
    NSLog(@"Date: %@", toDay);
    for (int index = 1; index <= 30; index++) {
        YKStudent *student = [[YKStudent alloc] init];
//        student.name = [NSString stringWithFormat:@"Student%d", index];
        student.name = [student setName];
        student.lastName = [student setLastName];
        student.age = arc4random_uniform(34) + 16;
        intmax_t dayOfBirth = 60 * 60 * 24 * 364 * student.age - 60 * 60 * 24 * (arc4random_uniform(363) + 1);
//        UInt64 intmax_t dayOfBirth = dayOfBirth
//        student.dateOfBirth = [NSDate dateWithTimeInterval:-dayOfBirth sinceDate:toDay]; //OR=>
        student.dateOfBirth = [NSDate dateWithTimeIntervalSinceNow:-dayOfBirth];
        [mutableStudents addObject:student];
//        NSLog(@"student: %@", student);
    }
    
    NSLog(@"%@", mutableStudents);
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
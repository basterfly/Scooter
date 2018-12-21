//
//  AppDelegate.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 11.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "AppDelegate.h"
#import "NSDictionaryTests.h"
#import "YK8HomeWork.h"
#import "YK9DelegatesTests.h"
#import "YK9DelegatesHomeWork.h"
#import "YKNotificationTest10.h"
#import "YKDoctor10.h"
#import "YKBusinessman10hw.h"
#import "YKSelectorsTest11.h"
#import "YKBlocksTests.h"
#import "YKBlockObject.h"
#import "YKBlocksHW.h"

typedef void (^TestTypedefBlockApp) (void);

@interface AppDelegate ()
//@property (strong, nonatomic) YKGovernment *government;
@property (strong, nonatomic) YKDoctor10 *doc;
@property (strong, nonatomic) YKBusinessman10hw *businnesman2;
@property (strong, nonatomic) YKBlocksTests *blockTest;
@property (copy, nonatomic) TestTypedefBlockApp typedefBlockApp;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"~~~~~~~~~~~~YK NSDictionaryTests tests~~~~~~~~~~~~");
    [NSDictionaryTests tests];
    
    NSLog(@"~~~~~~~~~~~~YK8HomeWork students~~~~~~~~~~~~");
    [YK8HomeWork students];
    
    NSLog(@"~~~~~~~~~~~~YK9 Delegates Tests~~~~~~~~~~~~");
    [YK9DelegatesTests delegateTest];
    
    NSLog(@"~~~~~~~~~~~~YK9Delegates HomeWork~~~~~~~~~~~~");
    [YK9DelegatesHomeWork delegatesHomWork];
    
    NSLog(@"~~~~~~~~~~~~YK9DNotifications Tests~~~~~~~~~~~~");
    YKNotificationTest10 *notificationTestObj = [[YKNotificationTest10 alloc] init];
    [notificationTestObj notificationTest];
    self.doc = [[YKDoctor10 alloc] init];
    self.businnesman2 = [[YKBusinessman10hw alloc] init];
    
    NSLog(@"~~~~~~~~~~~~YKSelectorsTests11~~~~~~~~~~~~");
    YKSelectorsTest11 *test = [[YKSelectorsTest11 alloc] init];
    [test selectorsTests];
    
    NSLog(@"~~~~~~~~~~~~YKBlocksTests12~~~~~~~~~~~~");
    YKBlocksTests *blockTest = [[YKBlocksTests alloc] init];
    [blockTest blocksTests];
    
    YKBlockObject *obj1 = [[YKBlockObject alloc] init];
    obj1.name = @"OBJECT1_APP";
    TestTypedefBlockApp typedefBlockApp = ^{                     //т.к. на этот блок у нас сделано проперти, то на него устанавливается стронг ссылка
        NSLog(@"Obj name is: %@", obj1.name);
    };

    typedefBlockApp();                       // поэтому обьект который вызывается в данном блоке тоже имеет стронг ссылку и не умирает
    
    
    YKBlockObject *obj2 = [[YKBlockObject alloc] init];
    obj2.name = @"OBJECT2_APP";
    self.typedefBlockApp = ^{                     //т.к. на этот блок у нас сделано проперти, то на него устанавливается стронг ссылка
        NSLog(@"Obj name is: %@", obj2.name);
    };
    
    self.typedefBlockApp();                 // поэтому обьект который вызывается в данном блоке тоже имеет стронг ссылку и не умирает
    
    NSLog(@"~~~~~~~~~~~~YKBlocksHomeWork12~~~~~~~~~~~~");
    YKBlocksHW *blocksHW1 = [[YKBlocksHW alloc] init];
    [blocksHW1 blocksHW];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@ : Sleeeeep ZZzzzz", self);
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@ : Woke Up", self);
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

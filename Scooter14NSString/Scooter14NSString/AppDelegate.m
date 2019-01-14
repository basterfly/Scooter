//
//  AppDelegate.m
//  Scooter14NSString
//
//  Created by Egor Kozlovskiy on 1/14/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *string1 = @"String1";
    NSString *string2 = @"String2";
    
    NSArray *strings = [NSArray arrayWithObjects:string1, string2, nil];
    for (NSString *str in strings) {
        if ([str isEqualToString:string2]) {
            NSLog(@"index = %lu", (unsigned long)[strings indexOfObject:str]); //ALL Objects will to compare or isEqual
            // and simple values we can compare like ==
        }
    }
    
    string1 = @"Hello, World!";
    NSLog(@"%@", string1);
    NSRange range = [string1 rangeOfString:@"World"];
    NSLog(@"range = %@", NSStringFromRange(range));
//
    range = [string1 rangeOfString:@"world"];
    if (range.location != NSNotFound) {
        NSLog(@"range = %@", NSStringFromRange(range));
    } else {
        NSLog(@"not found");
    }
    
//
//    range = [string1 rangeOfString:@"world" options:NSCaseInsensitiveSearch];
    range = [string1 rangeOfString:@"world" options:NSCaseInsensitiveSearch | NSBackwardsSearch];
    if (range.location != NSNotFound) {
        NSLog(@"range = %@", NSStringFromRange(range));
    } else {
        NSLog(@"not found");
    }
    
    string2 = [string1 substringFromIndex:5];
    NSLog(@"%@", string2);
    string2 = [string1 substringToIndex:5];
    NSLog(@"%@", string2);
    string2 = [string1 substringWithRange:NSMakeRange (5, 7)];
    NSLog(@"%@", string2);

//
    NSRange searchRange = NSMakeRange(0, [string1 length]);
    NSUInteger counter = 0;
    while (YES) {
        NSRange range = [string1 rangeOfString:@"l" options:0 range:searchRange];
        if (range.location != NSNotFound) {
            NSUInteger index = range.location + range.length;
            searchRange.location = index;
            searchRange.length = [string1 length] - index;
            NSLog(@"%@", NSStringFromRange(range));
            counter++;
        } else {
            break;
        }
    }
    
    NSLog(@"Counter = %lu", counter);
    
//
    string2 = [string1 stringByReplacingOccurrencesOfString:@"l" withString:@"L"];
    NSLog(@"%@", string2);
    
    string2 = [string1 uppercaseString];
    NSLog(@"%@", string2);
    
    string2 = [string1 lowercaseString];
    NSLog(@"%@", string2);
    
    string2 = [string2 capitalizedString];
    NSLog(@"%@", string2);
    
    NSLog(@"%d", [@"512" intValue]);
    
    string2 = [string1 stringByReplacingOccurrencesOfString:@"," withString:@" "];
    string2 = [string2 stringByReplacingOccurrencesOfString:@"!" withString:@" "];
    NSLog(@"%@", string2);
    
    strings = [string1 componentsSeparatedByString:@" "];
    NSLog(@"%@", strings);
    
    string2 = [strings componentsJoinedByString:@"_"];
    NSLog(@"%@", string2);
    
    // рассмотреть регулярные выражения!
    
    NSLog(@"%@", [string1 stringByAppendingString:string2]);
    
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

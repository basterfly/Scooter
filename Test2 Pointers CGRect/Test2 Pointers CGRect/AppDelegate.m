//
//  AppDelegate.m
//  Test2 Pointers CGRect
//
//  Created by Egor on 02.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "AppDelegate.h"
#import "YKPatient.h"
#import "YKStudent.h"
#import "YKDancer.h"
#import "YKDeveloper.h"

#import "YKTask7.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    BOOL boolVar = YES;
    int intVar = arc4random();
    NSUInteger nsuintVar = arc4random();
    float floatVar = arc4random() + (arc4random() / 10);
    
    NSNumber *boolObject = [NSNumber numberWithBool: boolVar];
    NSNumber *intObject = [NSNumber numberWithInt:intVar];
    NSNumber *nsuintObject = [NSNumber numberWithUnsignedInteger: nsuintVar];
    NSNumber *floatObject = [NSNumber numberWithFloat:floatVar];
    
    NSArray *numbers = [NSArray arrayWithObjects:boolObject, intObject, nsuintObject, floatObject, nil];
    for (NSNumber *number in numbers) {
        NSLog(@"-- %.2@",number);
    }
    
    CGPoint point;
    point.x = arc4random_uniform(10);
    point.y = arc4random_uniform(10) + (arc4random_uniform(10) * 0.1);
    
    CGPoint point1 = CGPointMake(5.5f, 4.2);
    CGPoint point2 = CGPointMake(arc4random_uniform(10), 4.5f);
    CGPoint point3 = CGPointMake(5, arc4random_uniform(10) + (arc4random_uniform(10) * 0.1));
    CGPoint point4 = CGPointMake(3.5f, arc4random_uniform(10) + (arc4random_uniform(10) * 0.1));
    
    NSValue *vPoint = [NSValue valueWithCGPoint: point];
    NSValue *vPoint2 = [NSValue valueWithCGPoint: point2];
    
    NSArray *points = @[[NSValue valueWithCGPoint: point], [NSValue valueWithCGPoint:point1],
                        [NSValue valueWithCGPoint: point2], [NSValue valueWithCGPoint:point3],
                        [NSValue valueWithCGPoint:point4], vPoint, vPoint2];
    for (NSValue *value in points) {
        CGPoint p = [value CGPointValue];
        NSLog(@"point %lu = %@",(unsigned long)[points indexOfObject:(value)], NSStringFromCGPoint(p));
    }
    
    NSLog(@"§§§§§§§§§§§§§§-TEST2-§§§§§§§§§§§§§§§§§§");
    
    CGPoint pointOrigin;
    pointOrigin.x = 0;
    pointOrigin.y = 0;
    
    CGSize size;
    size.height = 10;
    size.width = 10;
    
    CGRect rect;
    rect.origin = pointOrigin;
    rect.size = size;
    
    CGRect rect1 = CGRectMake(3.5, 3.5, 3, 3);
    NSMutableArray * mutableArr = [[NSMutableArray alloc] init];
    for (NSValue *value in points) {
        CGPoint point = [value CGPointValue];
        BOOL result = CGRectContainsPoint(rect1, point);
        if (result) {
            [mutableArr addObject:value];
        }
        
        NSLog(@"Point# %lu = %@ - Status of point contains -%@-",
              (unsigned long)[points indexOfObject: value], NSStringFromCGPoint(point), (result ? @"YES" : @"NO"));
    }
    
    NSLog(@"--Positive points added in NSMutable Array--");
    for (NSValue *value in mutableArr) {
        CGPoint point = [value CGPointValue];
        NSLog(@"point %lu = %@",(unsigned long)[points indexOfObject:(value)], NSStringFromCGPoint(point));
    }
    
//    TEst 2 Protocols
    
    NSLog(@"§§§§§§§§§§§§§§-TEST3 Protocols-§§§§§§§§§§§§§§§§§§");
    
    YKStudent *student1 = [[YKStudent alloc] init];
    YKStudent *student2 = [[YKStudent alloc] init];
    YKDancer *dancer1 = [[YKDancer alloc] init];
    YKDancer *dancer2 = [[YKDancer alloc] init];
    YKDancer *dancer3 = [[YKDancer alloc] init];
    YKDeveloper *dev1 = [[YKDeveloper alloc] init];
    
    student1.name = @"Student1";
    student2.name = @"Student2";
    dancer1.name = @"Dancer1";
    dancer2.name = @"Dancer2";
    dancer3.name = @"Dancer3";
    dev1.name = @"Developer1";
    
    NSObject *fakeObj = [[NSObject alloc] init];
    
    
    NSArray *patients = @[fakeObj, student1, student2, dancer1, dancer2, dancer3, dev1];
    
    for (/*NSObject * */ id <YKPatient> patient in patients) {
        
        if ([patient conformsToProtocol:@protocol(YKPatient)]) {
            NSLog(@"%@", patient.name);
            if ([patient respondsToSelector:@selector(howIsYourFamily)]) {
                NSLog(@"-Doc: How is your family? \n -%@: Thanks, %@", patient.name, [patient howIsYourFamily]);
            }
            
            if ([patient respondsToSelector:@selector(howIsYourJob)]) {
                NSLog(@"-Doc: How is your job? \n -%@: Thanks, %@", patient.name, [patient howIsYourJob]);
            }
            
            if (![patient areYouOk]) {
                [patient takePill];
                if (![patient areYouOk]) {
                    [patient makeShot];
                }
            }
            NSLog(@"Patient %@ is OK!", patient.name);
        } else {
            NSLog(@"FAKE!!!");
        }
    }
    
    [YKTask7 task7];
    
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

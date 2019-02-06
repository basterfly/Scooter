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
    
    
//    Homework pupil
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
    
//    Student
    NSMutableArray *humanitySpec = [NSMutableArray new];
    NSMutableArray *techSpec = [NSMutableArray new];
    uint countOfDevelopers = 0;
    for (YKStudentHW *studentHw in students) {
        int value = 1;
        int classesValue = 0;
        uint quantityOfHumanitySpec = 0;
        uint quantityOfTechSpec = 0;
        while ( classesValue <= studentHw.typeOfClass) {
            classesValue += value;
            if (studentHw.typeOfClass == (studentHw.typeOfClass | value)) {
                if ((value & YKStudentHWClassTypeEnglish) ||
                    (value & YKStudentHWClassTypeHistory) ||
                    (value & YKStudentHWClassTypeDesign) ||
                    (value & YKStudentHWClassTypeBiology)) {
                    quantityOfHumanitySpec += 1;
                }
                
                if ((value & YKStudentHWClassTypeMAth) ||
                    (value & YKStudentHWClassTypeProgramming) ||
                    (value & YKStudentHWClassTypeEngineering) ||
                    (value & YKStudentHWClassTypeChemestry)) {
                    quantityOfTechSpec += 1;
                    if (YKStudentHWClassTypeProgramming & value) {
                        countOfDevelopers +=1;
                    }
                }
            }
            
            value = value << 1;
        }
        
        if (quantityOfHumanitySpec == quantityOfTechSpec) {
            NSLog(@"%@ - NOT DEFINED WITH SPECIALITY", studentHw.name);
        }
        
        if (quantityOfHumanitySpec > quantityOfTechSpec) {
            [humanitySpec addObject:studentHw];
        } else {
            [techSpec addObject:studentHw];
        }
        
        NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        NSLog(@"Student is - %@", studentHw);
    }
    
    NSLog(@"humanities Speciality has %lu - students", [humanitySpec count]);
    NSLog(@"technical Speciality has %lu - students", [techSpec count]);
    NSLog(@"Students which study Development are %u", countOfDevelopers);
    [students removeObjectsInArray:humanitySpec];
    [students removeObjectsInArray:techSpec];
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    NSLog(@"students.count = %lu  students: %@ \n", [students count], students);
    
    //Мастер
    [students addObjectsFromArray:humanitySpec];
    [students addObjectsFromArray:techSpec];
    for (YKStudentHW *student in students) {
        if (student.typeOfClass & YKStudentHWClassTypeBiology) {
            NSLog(@"%@", student);
            NSLog(@"%@ - wants to study Biology \nBut Biology course is cancelled!", student.name);
            student.typeOfClass = (~YKStudentHWClassTypeBiology) & student.typeOfClass;
            NSLog(@"%@", student);
        }
    }
    
    [students removeAllObjects];
    for (YKStudentHW *student in humanitySpec) {
        NSLog(@"%@", student);
    }
    
    for (YKStudentHW *student in techSpec) {
        NSLog(@"%@", student);
    }
    
//    Супермен
    int randomeInt = arc4random_uniform(INT_MAX);
    NSString *string = [[NSString alloc] init];
    NSString *stringTemp = [[NSString alloc] init];
    for (int index = 0; index <= (sizeof(int) * 8) - 1; index++) {
        NSString *string0 = @"0";
        NSString *string1 = @"1";
        if (randomeInt & (1 << index)) {
            string = [stringTemp stringByAppendingFormat:@"%@%@", string1, string];
        } else {
            string = [stringTemp stringByAppendingFormat:@"%@%@", string0, string];
        }
        if (index == 7 || index == 15 || index == 23) {
            string = [stringTemp stringByAppendingFormat:@"%@%@", @" ", string];
        }
    }
    
    NSLog(@"%d = %@", randomeInt, string);
    
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

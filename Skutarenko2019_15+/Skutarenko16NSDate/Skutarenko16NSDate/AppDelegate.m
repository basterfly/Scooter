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

@property (weak, nonatomic) NSTimer *timer;
@property (strong, nonatomic) YKStudent *student;
@property (strong, nonatomic) NSMutableArray *mutableStudents;
@property (strong, nonatomic) NSDate *searchDate;
@property (assign ,nonatomic) int index;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.mutableStudents = [[NSMutableArray alloc] init];
    NSDate *toDay = [NSDate date];
    NSLog(@"Date: %@", toDay);
    for (int index = 1; index <= 30; index++) {
        self.student = [[YKStudent alloc] init];
        self.student.name = [self.student setName];
        self.student.lastName = [self.student setLastName];
        self.student.age = arc4random_uniform(34) + 16;
        intmax_t dayOfBirth = 60 * 60 * 24 * 364 * self.student.age - 60 * 60 * 24 * (arc4random_uniform(363) + 1);
//        student.dateOfBirth = [NSDate dateWithTimeInterval:-dayOfBirth sinceDate:toDay]; //OR=>
        self.student.dateOfBirth = [NSDate dateWithTimeIntervalSinceNow:-dayOfBirth];
        [self.mutableStudents addObject:self.student];
//        NSLog(@"student: %@", student);
    }
    
    NSSortDescriptor *sortDescriptorByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSSortDescriptor *sortDescriptorByDateOfBirth = [NSSortDescriptor sortDescriptorWithKey:@"dateOfBirth" ascending:YES];
    [self.mutableStudents sortUsingDescriptors:[NSArray arrayWithObjects:sortDescriptorByDateOfBirth, sortDescriptorByName, nil]];
    NSLog(@"%@", self.mutableStudents);
    
//    Master
    NSTimer *timer = [[NSTimer alloc] init];
    self.timer = timer;
    /*void (^myBlock)(NSTimer *) = ^(NSTimer *timer){
        NSLog(@"~~~ BLOCK ~~~");
        NSDate *testDate = [NSDate dateWithTimeIntervalSinceNow:(-1 * (60 * 60 * 24 * 365 * 51))];
        for (YKStudent *student in mutableStudents) {
            
            
            if (testDate == student.dateOfBirth) {
                NSLog(@"~~~~~~~~~~~~~~~~~~~~~~/nHAPPY BIRTHDAY!!!\n~~~~~~~~~~~~~~~~~~~~~~");
                NSLog(@"%@", student);
            }
            
            testDate = [NSDate dateWithTimeInterval:(60 * 60 * 24) sinceDate:testDate];
            if (testDate == [NSDate date]) {
                [timer invalidate];
                continue;
            }
        }
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss - dd.MMM .YYYY"];
        NSLog(@"%@", [formatter stringFromDate:testDate]);
    };*/
    
//    [NSTimer scheduledTimerWithTimeInterval:0.25 repeats:YES block:myBlock ];
//    NSDate *testDate = [NSDate dateWithTimeIntervalSinceNow:(-1 * (60 * 60 * 24 * 365 * 51))];
    self.searchDate = [[NSDate alloc] initWithTimeIntervalSinceNow:(-1 * (60 * 60 * 24 * 365 * 50))];
//    for (id student in self.mutableStudents) {
//        self.student = student;
    NSArray *tempStudents = [NSArray arrayWithArray:self.mutableStudents];
    self.index = 0;
    self.student = [self.mutableStudents objectAtIndex:self.index];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
//            [self performSelector:@selector(timerTest)];
//            [self performSelector:@selector(timerTest:) withObject: self.student];
    
//    self.timer = nil;
    NSLog(@"TEST FINISH");
    
    YKStudent *student1 = [tempStudents objectAtIndex:[tempStudents count] - tempStudents.count];
    YKStudent *student2 = [tempStudents objectAtIndex:[tempStudents count] - 1];
    NSDate *differenceOfAges = [[NSDate alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |
                                                        NSCalendarUnitWeekOfYear | NSCalendarUnitHour | NSCalendarUnitMinute
                                                                                                    fromDate:student1.dateOfBirth
                                                                                                    toDate:student2.dateOfBirth
                                                                                                    options:0];
    NSLog(@"Difference of age between first student and last student is: %@", components);
    return YES;
}

-(void)timerTest {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd:MMM:YYYY"];
    for (; self.index < [self.mutableStudents count]; self.index++) {
        self.student = [self.mutableStudents objectAtIndex:self.index];
        if ([[formatter stringFromDate:self.student.dateOfBirth] isEqualToString:[formatter stringFromDate:self.searchDate]]) {
            NSLog(@"%@ \n ~~~~~~ Happy Birthday! ~~~~~~  date: %@", self.student, [formatter stringFromDate:self.searchDate]);
            [self.mutableStudents removeObject:self.student];
            self.index -= 1;
        }
    }

    if ([self.mutableStudents count] == 0) {
        NSLog(@"TIMER INVALIDATED by last student Birthday");
        [self.timer invalidate];
    }
    
    self.searchDate = [NSDate dateWithTimeInterval:(60 * 60 * 24) sinceDate:self.searchDate];
    self.index = 0;
}

-(void)timerTest: withWith:(id)idd {
//    NSLog(@"index = %d", self.index);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MMM.YYYY"];
    NSArray *tempStudents = [NSArray arrayWithArray:self.mutableStudents];
    for (; self.index < [self.mutableStudents count]; ) {
        self.student = [self.mutableStudents objectAtIndex:self.index];
        
//сравниваем ДР студента с текущей даой потом переходим к след студенту и так их всех прогоняем по каждому дню
            if ([[formatter stringFromDate:self.searchDate] isEqualToString:[formatter stringFromDate:self.student.dateOfBirth]]) {
                NSLog(@"%@ \n ~~~~~~ Happy Birthday! ~~~~~~ \n date: %@", self.student, [formatter stringFromDate:self.searchDate]);
                [self.mutableStudents removeObject:self.student];
//                if ([self.student isEqual:[self.mutableStudents objectAtIndex:[self.mutableStudents count] - 1]]) {
                if ([self.mutableStudents count] == 0) {
                    [self.timer invalidate];
                    self.timer = nil;
                    NSLog(@"TIMER INVALIDATED by last student Birthday");
                    [self.mutableStudents arrayByAddingObjectsFromArray:tempStudents];
//                    break;
                    continue;
                }
//            }
        
            } else if ([self.mutableStudents count] != 1) {
            self.index++;
        }
        
            if ([self.student isEqual:[self.mutableStudents objectAtIndex:[self.mutableStudents count] - 1]]) {
                self.searchDate = [NSDate dateWithTimeInterval:(60 * 60 * 24) sinceDate:self.searchDate];
                self.index = 0;
            }
        }
    }

//сделать метод от таймера который посто будет пробегать день за днем и который будет дергать студента и спрашивать сегодня у тя ДР?
-(void)timerTest:(YKStudent *)student {
//-(void)timerTest {
    NSDate *testDate = [NSDate dateWithTimeIntervalSinceNow:(-1 * (60 * 60 * 24 * 365 * 51))];
//    for (NSDate *testDate = [NSDate dateWithTimeIntervalSinceNow:(-1 * (60 * 60 * 24 * 365 * 51))]; testDate <= student.dateOfBirth; ) {
    do  { //(![testDate isEqual:[NSDate date]])
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd.MMM.YYYY"];
        
        
//        if ([testDate isEqual: student.dateOfBirth]) {
        if ([[formatter stringFromDate:testDate] isEqual: [formatter stringFromDate:student.dateOfBirth]]) {
            NSLog(@"%@", [formatter stringFromDate:testDate]);
            NSLog(@"%@\n~~~~~~~~~~~~~~~~~~~~~~\nHAPPY BIRTHDAY!!!\n~~~~~~~~~~~~~~~~~~~~~~\n", student);
            
            if (student == [self.mutableStudents objectAtIndex:[self.mutableStudents count] - 1]) {
                [self.timer invalidate];
            }
            
            break;
        }
        
        testDate = [NSDate dateWithTimeInterval:(60 * 60 * 24) sinceDate:testDate];

    } while (![testDate isEqual:[NSDate date]]);
     
//        if ([testDate isEqual:[NSDate date]]) {
//            [self.timer invalidate];
//            continue; //break;
//        }
    
//    }
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

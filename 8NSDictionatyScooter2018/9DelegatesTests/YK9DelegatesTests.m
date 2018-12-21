//
//  YK9DelegatesTests.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YK9DelegatesTests.h"
#import "YK9Patient.h"
#import "YK9Doctor.h"

@implementation YK9DelegatesTests

+ (void) delegateTest {
    YK9Patient *patient1 = [[YK9Patient alloc] init];
    patient1.name = @"Vova";
    patient1.temperature = 36.6f;
    
    YK9Patient *patient2 = [[YK9Patient alloc] init];
    patient2.name = @"Petya";
    patient2.temperature = 40.2f;
    
    YK9Patient *patient3 = [[YK9Patient alloc] init];
    patient3.name = @"Dima";
    patient3.temperature = 37.1f;
    
    YK9Patient *patient4 = [[YK9Patient alloc] init];
    patient4.name = @"Sasha";
    patient4.temperature = 37.2f;
    
    YK9Doctor *doctor1 = [[YK9Doctor alloc] init];
    patient1.delegate = doctor1;
    patient2.delegate = doctor1;
    patient3.delegate = doctor1;
    patient4.delegate = doctor1;
    
//    V1
//    NSLog(@"Doctor: %@ are you OK? %@", patient1.name, [patient1 howAreYou] ? @"YES" : @"NO");
//    NSLog(@"Doctor: %@ are you OK? %@", patient2.name, [patient2 howAreYou] ? @"YES" : @"NO");
//    NSLog(@"Doctor: %@ are you OK? %@", patient3.name, [patient3 howAreYou] ? @"YES" : @"NO");
//    NSLog(@"Doctor: %@ are you OK? %@", patient4.name, [patient4 howAreYou] ? @"YES" : @"NO");
//    V2
    NSLog(@"Doctor: %@ are you OK? ", patient1.name);
    [patient1 howAreYou];
    NSLog(@"Doctor: %@ are you OK? ", patient2.name);
    [patient2 howAreYou];
    NSLog(@"Doctor: %@ are you OK? ", patient3.name);
    [patient3 howAreYou];
    NSLog(@"Doctor: %@ are you OK? ", patient4.name);
    [patient4 howAreYou];
    
}

@end

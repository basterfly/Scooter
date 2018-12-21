//
//  YK9PatientHW.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 20.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YK9PatientHW.h"
//#import "YK9DoctorHW.h"

@implementation YK9PatientHW

- (BOOL) areYouOk {
    BOOL howYouFeel = arc4random() % 2;
    NSLog(@"Patient: %@", howYouFeel ? @"YES" : @"NO");
    if (howYouFeel) {
        NSLog(@"I am Good!");
    } else {
        NSLog(@"I feel BAD! ");
        [self.delegate patientFeelsBad:self];
        [self.delegate patient: self hasAQuestion:@"Doctor, I will alive?"];
    }
    
    return howYouFeel;
}

- (void) takePill {
    NSLog(@"%@ take a pill!", self.name);
}

- (void) makeShot {
    NSLog(@"%@ makes a shot!", self.name);
//    [ report];
}

- (void) feelsBad {
    NSLog(@"%@: Doctor! I feels bad!", self.name);
    [self.delegate patientFeelsBad:self];
    [self.delegate patient:self hasAQuestion:@"Doctor, I will alive?"];
}

- (void) friendHelpMe {
    NSLog(@"%@: Friend Help me!", self.name);
}

- (void) haveAnAche {
    self.ache = arc4random_uniform(3);
    if (self.ache == headAche) {
        [self.delegate patient: self hasAche: self.ache];
    }
    
    self.ache = arc4random_uniform(3);
    if (self.ache == handAche) {
        [self.delegate patient: self hasAche: self.ache];
    }
    
    self.ache = arc4random_uniform(3);
    if (self.ache == stomachAche) {
        [self.delegate patient: self hasAche: self.ache];
    }
}

@end

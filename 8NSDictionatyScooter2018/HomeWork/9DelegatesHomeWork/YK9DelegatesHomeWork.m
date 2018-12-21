//
//  YK9DelegatesHomeWork.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 20.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YK9DelegatesHomeWork.h"
#import "YK9PatientHW.h"
#import "YK9DoctorHW.h"
#import "YK9FriendHW.h"

@implementation YK9DelegatesHomeWork

+ (void) delegatesHomWork {
    NSLog(@"~~~~~~~~~~~~ Delegates HomeWork Pupil~~~~~~~~~~~~~~~~");
    
    YK9PatientHW *patient1 = [[YK9PatientHW alloc] init];
    YK9PatientHW *patient2 = [[YK9PatientHW alloc] init];
    patient1.name = @"Sergey";
    patient1.temperature = arc4random_uniform(5) + 36.0f + (arc4random_uniform(9) / 10);
    patient1.stomachSick = arc4random_uniform(2) % 2;
    
    patient2.name = @"Tolyamba";
    patient2.temperature = arc4random_uniform(5) + 36.0f + (arc4random_uniform(9) / 10);
    patient2.stomachSick = arc4random_uniform(20) % 2;
    
    YK9DoctorHW *doctor1 = [[YK9DoctorHW alloc] init];
    patient1.delegate = doctor1;
    patient2.delegate = doctor1;
//        v1
    NSLog(@"~~~~~~~~~~~~V1~~~~~~~~~~~~~~~~");
    NSLog(@"Doctor: Are you feels good %@? ", patient1.name);
    [patient1 areYouOk];
    NSLog(@"Doctor: Are you feels good %@? ", patient2.name);
    [patient2 areYouOk];
//    v2
    NSLog(@"~~~~~~~~~~~~V2 in Array~~~~~~~~~~~~~~~~");
    NSArray *patients = @[patient1, patient2];
    for (YK9PatientHW *patient in patients) {
        [patient feelsBad];
    }
    
    NSLog(@"~~~~~~~~~~~~ Delegates HomeWork Student~~~~~~~~~~~~~~~~");
    YK9FriendHW *friend1 = [[YK9FriendHW alloc] init];
//   v2
    YK9FriendHW *friend2 = [[YK9FriendHW alloc] init];
    NSArray *friends = @[friend1, friend2];
    for (id friend in friends) {
        //    v1
        for (YK9PatientHW *patient in patients) {
            BOOL friendOrDoctor = arc4random_uniform(20) % 2;
            if (friendOrDoctor) {
                [patient feelsBad];
            } else {
                [patient friendHelpMe];
                [friend friendsHelthCare];
            }
    }
    }
    
    NSLog(@"~~~~~~~~~~~~ Delegates HomeWork Master~~~~~~~~~~~~~~~~");
    NSUInteger indexAche = 0;
    for (YK9PatientHW *patient in patients) {
        indexAche = 0;
        /*if (arc4random_uniform(10) % 2) {
            NSLog(@"%@: I have Head ache!", patient.name);
            [patient.delegate patientHeadAche:patient];
            indexAche += 1;
        }
        
        if (arc4random_uniform(10) % 2) {
            NSLog(@"%@: I have Hand ache!", patient.name);
            [patient.delegate patientHandAche:patient];
            indexAche += 1;
        }
        
        if (arc4random_uniform(10) % 2) {
            NSLog(@"%@: I have Stomach ache!", patient.name);
            [patient.delegate patientStomachAche:patient];
            indexAche += 1;
        }*/
        for (NSUInteger iterator = 1; iterator <= 3; iterator++) {
            YK9PatientAcheHW ache = arc4random_uniform(3);
            if (ache == headAche) {
                NSLog(@"%@: I have Head ache!", patient.name);
            }
            
            if (ache == handAche) {
                NSLog(@"%@: I have Hand ache!", patient.name);
            }
            
            if (ache == stomachAche) {
                NSLog(@"%@: I have Stomach ache!", patient.name);
            }
            
            [patient.delegate patient:patient hasAche:ache];
            indexAche ++;
        }
        
        if (indexAche >= 2) {
            NSLog(@"Doctor: You must stay in hospital for tests!");
        } else {
            [doctor1 doctorSayYes];
        }
    }
    
    [doctor1 printReport];

    NSLog(@"~~~~~~~~~~~~ Delegates HomeWork Superman~~~~~~~~~~~~~~~~");
    YK9DoctorHW *doctor2 = [[YK9DoctorHW alloc] init];
    patient1.doctorMark = 1;
    patient2.doctorMark = 1;
//    patient1.delegate = doctor2;
//    patient2.delegate = doctor2;
    NSLog(@"Patients Doctor is doctor1 %@", doctor1);
    indexAche = 0;
    for (NSUInteger day = 1; day <= 2; day++) {
        NSLog(@"~~~~~~~~~~~~ Day %lu~~~~~~~~~~~~~~~~", day );
        for (YK9PatientHW *patient in patients) {
            indexAche = 0;
            for (NSUInteger iterator = 1; iterator <= 3; iterator++) {
                YK9PatientAcheHW ache = arc4random_uniform(3);
                if (ache == headAche) {
                    NSLog(@"%@: I have Head ache!", patient.name);
                }
            
                if (ache == handAche) {
                    NSLog(@"%@: I have Hand ache!", patient.name);
                }
            
                if (ache == stomachAche) {
                    NSLog(@"%@: I have Stomach ache!", patient.name);
                }
            
                [patient.delegate patient:patient hasAche:ache];
                indexAche ++;
            }
        
            if (indexAche >= 2) {
                NSLog(@"Doctor: You must stay in hospital for tests!");
            } else {
                if (patient.delegate == doctor2) {
                    [doctor2 doctorSayYes];
                } else {
                    [doctor1 doctorSayYes];
                }
            }
        
            if (patient.delegate == doctor2) {
                [doctor2 printReport];
            } else {
                [doctor1 printReport];
            }
        
            patient.doctorMark = arc4random_uniform(2); //меняем доктора если выпадет
            if (patient.doctorMark == 0) {
                if (patient.delegate == doctor2) {
                    patient.delegate = doctor1;
                    NSLog(@"Patient`s Doctor changed on %@ (doctor1)", patient.delegate);
                } else {
                    patient.delegate = doctor2;
                    NSLog(@"Patient`s Doctor changed on %@ (doctor2)", patient.delegate);
                }
            }
        }
    }
}

@end

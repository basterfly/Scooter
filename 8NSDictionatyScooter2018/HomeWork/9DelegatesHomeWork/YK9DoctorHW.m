//
//  YK9DoctorHW.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 20.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YK9DoctorHW.h"
#import "YK9PatientHW.h"

@implementation YK9DoctorHW

- (instancetype)init
{
    self = [super init];
    self.patientsReport = [[NSDictionary alloc] init];
    self.keys = [[NSMutableArray alloc] init];
    self.objects = [[NSMutableArray alloc] init];
    self.patientNumber = 1;
    
    self.patientsHeadAcheReport = [[NSDictionary alloc] init];
    self.keysHeadAche = [[NSMutableArray alloc] init];
    self.objectsHeadAche = [[NSMutableArray alloc] init];
    
    self.patientsHandAcheReport = [[NSDictionary alloc] init];
    self.keysHandAche = [[NSMutableArray alloc] init];
    self.objectsHandAche = [[NSMutableArray alloc] init];
    
    self.patientsStomachAcheReport = [[NSDictionary alloc] init];
    self.keysStomachAche = [[NSMutableArray alloc] init];
    self.objectsStomachAche = [[NSMutableArray alloc] init];
    
    return self;
}

- (void) patientFeelsBad: (YK9PatientHW *) patient {
    NSLog(@"Patient %@ feels bad", patient.name);
    NSLog(@"Doctor: How your stomach %@?", patient.name);
    if (patient.stomachSick == arc4random_uniform(9) % 2) {
        NSLog(@"%@ my stomach is good!", patient.name);
        NSLog(@"Doctor: GOOD!");
    } else {
        NSLog(@"%@ my stomach is sick!", patient.name);
        NSLog(@"Doctor: %@ teke a pill for your stomach!", patient.name);
        [patient takePill];
    }
    
    if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature > 39.f) {
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should rest!", patient.name);
    }
}

- (void) patient:(YK9PatientHW *) patient hasAQuestion:(NSString *) question {
    NSLog(@"Patient %@ has a question: %@.", patient.name, question);
    [self doctorSayYes];
}

-(void) doctorSayYes {
    NSLog(@"Doctor: YES! Everythin is good! Don`t worry!");
}

- (void) patientHeadAche:(YK9PatientHW *)patient {
    NSLog(@"%@: I have a head ache.", patient.name);
    [patient takePill];
}

- (void) patientHandAche:(YK9PatientHW *)patient {
    NSLog(@"Doctor: We must seen what happend with your hand, so we will make a rentgen.");
    BOOL handAcheindex1 = arc4random_uniform(10) % 2;
    if (handAcheindex1) {
        NSLog(@"Doctor: Your hand is broken!");
        [patient makeShot];
        NSLog(@"Doctor: We must make a bandage!");
    } else {
        NSLog(@"Doctor: Your hand is normal!");
    }
}

- (void) patientStomachAche:(YK9PatientHW *) patient {
    BOOL stomachAcheindex1 = arc4random_uniform(10) % 2;
    NSLog(@"Doctor: We must make an USI for information what happend with your stomach.");
    if (stomachAcheindex1) {
        NSLog(@"Doctor: Your stomach not good!");
        [patient takePill];
        NSLog(@"Doctor: I think we need to surge!"); //        surgery
    } else {
        NSLog(@"Doctor: Your stomach is normal! Just wait and go to a toilet.");
    }
}

- (void) patientsReport:(YK9PatientHW *) patient withAche: (YK9PatientAcheHW) ache {
    if (ache == headAche) {
        NSString *str = [NSString stringWithFormat:@"%lu - Head Ache",(unsigned long)self.patientNumber];
        [self.keys addObject:str];
        [self.objects addObject:[patient name]];
        
        [self.keysHeadAche addObject:str];
        [self.objectsHeadAche addObject:[patient name]];
        
        self.patientNumber ++;
    }
    
    if (ache == handAche) {
        NSString *str = [NSString stringWithFormat:@"%lu - Hand Ache",self.patientNumber];
        [self.keys addObject:str];
        [self.objects addObject:[patient name]];
        
        [self.keysHandAche addObject:str];
        [self.objectsHandAche addObject:[patient name]];
        
        self.patientNumber ++;
    }
    
    if (ache == stomachAche) {
        NSString *str = [NSString stringWithFormat:@"%lu - Stomach Ache",self.patientNumber];
        [self.keys addObject:str];
        [self.objects addObject:[patient name]];
        
        [self.keysStomachAche addObject:str];
        [self.objectsStomachAche addObject:[patient name]];
        
        self.patientNumber ++;
    }
}

- (void) printReport {
    self.patientsReport = [NSDictionary dictionaryWithObjects: self.objects forKeys:self.keys];
    NSLog(@"Doctor`s %@ report: %@", self, self.patientsReport);
    
    self.patientsHeadAcheReport = [NSDictionary dictionaryWithObjects: self.objectsHeadAche forKeys:self.keysHeadAche];
    NSLog(@"\nDoctor`s %@ report: %@", self, self.patientsHeadAcheReport);
    
    self.patientsHandAcheReport = [NSDictionary dictionaryWithObjects: self.objectsHandAche forKeys:self.keysHandAche];
    NSLog(@"\nDoctor`s %@ report: %@", self, self.patientsHandAcheReport);
    
    self.patientsStomachAcheReport = [NSDictionary dictionaryWithObjects: self.objectsStomachAche forKeys:self.keysStomachAche];
    NSLog(@"\nDoctor`s %@ report: %@", self, self.patientsStomachAcheReport);
    
    [self init];
    
}

- (void) patient: (YK9PatientHW *) patient hasAche: (YK9PatientAcheHW) ache {
    if (ache == headAche) {
        [self patientHeadAche:patient];
        [self patientsReport:patient withAche:ache];
    }
    
    if (ache == handAche) {
        [self patientHandAche:patient];
        [self patientsReport:patient withAche:ache];
    }
    
    if (ache == stomachAche) {
        [self patientStomachAche:patient];
        [self patientsReport:patient withAche:ache];
    }
}

@end

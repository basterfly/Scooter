//
//  YK9Doctor.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YK9Doctor.h"
#import "YK9Patient.h"

@implementation YK9Doctor

#pragma mark - YKPatientDelegate9

- (void) patientFeelsBad:(YK9Patient *) patient {
    NSLog(@"Patient %@ feels bad", patient.name);
    if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature > 39.f) {
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should rest.", patient.name);
    }
}

- (void) patient:(YK9Patient *) patient hasQuestion:(NSString *) question {
    NSLog(@"Patient %@ has a question: %@.", patient.name, question);
}

@end

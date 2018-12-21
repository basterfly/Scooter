//
//  YK9PatientHW.h
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 20.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YKPatientDelegate9HW;

typedef enum {
    headAche,
    handAche,
    stomachAche,
} YK9PatientAcheHW;


@interface YK9PatientHW : NSObject
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic) BOOL stomachSick;
@property (assign, nonatomic) BOOL headSick;
@property (weak, nonatomic) id <YKPatientDelegate9HW> delegate;
@property (assign, nonatomic) YK9PatientAcheHW ache;
@property (assign, nonatomic) NSUInteger doctorMark;

- (BOOL) areYouOk;
- (void) takePill;
- (void) makeShot;
- (void) feelsBad;
- (void) friendHelpMe;
- (void) haveAnAche;

@end

@protocol YKPatientDelegate9HW <NSObject>

- (void) patientFeelsBad: (YK9PatientHW *) patient;
- (void) patient:(YK9PatientHW *) patient hasAQuestion:(NSString *) question;
//- (void) doctorSayYes;
- (void) patientHeadAche:(YK9PatientHW *) patient;
- (void) patientHandAche:(YK9PatientHW *) patient;
- (void) patientStomachAche:(YK9PatientHW *) patient;
- (void) patient: (YK9PatientHW *) patient hasAche: (YK9PatientAcheHW) ache;

@end


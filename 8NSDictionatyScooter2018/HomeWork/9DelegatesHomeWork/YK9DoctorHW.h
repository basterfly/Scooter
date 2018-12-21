//
//  YK9DoctorHW.h
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 20.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YKPatientDelegate9HW;

@interface YK9DoctorHW : NSObject <YKPatientDelegate9HW>
@property (strong, nonatomic) NSDictionary *patientsReport;
@property (strong, nonatomic) NSMutableArray *keys;
@property (strong, nonatomic) NSMutableArray *objects;

@property (strong, nonatomic) NSDictionary *patientsHeadAcheReport;
@property (strong, nonatomic) NSMutableArray *keysHeadAche;
@property (strong, nonatomic) NSMutableArray *objectsHeadAche;

@property (strong, nonatomic) NSDictionary *patientsHandAcheReport;
@property (strong, nonatomic) NSMutableArray *keysHandAche;
@property (strong, nonatomic) NSMutableArray *objectsHandAche;

@property (strong, nonatomic) NSDictionary *patientsStomachAcheReport;
@property (strong, nonatomic) NSMutableArray *keysStomachAche;
@property (strong, nonatomic) NSMutableArray *objectsStomachAche;


@property (assign, nonatomic) NSUInteger patientNumber;

- (void) doctorSayYes;
- (void) report:patient withAche: ache;
- (void) printReport;

@end

//
//  YKPatient12HW.h
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 03.12.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKPatient12HW : NSObject
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) BOOL healthStatus;

- (void)areYouOk:(YKPatient12HW *)patient;
- (void)iAmSick:(YKPatient12HW *)patient;
- (BOOL)randomStatus;
-(void)treatmentV2:(void(^)(YKPatient12HW *patient))treatBlockV2;
@end

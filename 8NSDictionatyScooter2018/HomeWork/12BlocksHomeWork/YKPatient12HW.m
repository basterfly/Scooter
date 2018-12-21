//
//  YKPatient12HW.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 03.12.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKPatient12HW.h"

typedef void(^YKTreatBlock)(YKPatient12HW *);
@implementation YKPatient12HW
@synthesize name, healthStatus;

YKTreatBlock treatBlock = ^(YKPatient12HW *patient) {
    NSLog(@"~~~I treatment you %@", patient.name);
    patient.healthStatus = [patient randomStatus];
};

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.healthStatus = 1;
        [self performSelector:@selector(iAmSick:) withObject:self afterDelay:[self randomTime]];    //только для СУПЕРМЕНА
    }
    
    return self;
}

- (void)areYouOk:(YKPatient12HW *)patient {
//    NSLog(@"%@", [self randomStatus] ? @"YES" : @"NO" );
    if (healthStatus) {
        NSLog(@"I am %@ GOOD! Everything is OK!", self.name);
    }
    
    if (!healthStatus) {
        NSLog(@"I am %@ SICK! I have an ache!", self.name);
    }
}

- (void)iAmSick:(YKPatient12HW *)patient {
    NSLog(@"%@: Am I sick?", patient.name);
    healthStatus = [patient randomStatus];
    if (healthStatus) {
        NSLog(@"~~~Doctor says: Dont worry! Just %@", [self randomStatus] ? @"TAKE A PILL" : @"MAKE A SHOT");
    }
    
    if (!healthStatus) {
        NSLog(@"~~~Doctor says: that I have a problem! Doctor hospitalize me!");
        [patient treatment:treatBlock];
    }
//    void (^treat)(YKPatient12HW *) = ^(YKPatient12HW *patient){
//        NSLog(@"~~~I treatment you %@", patient.name);
//    };
//    
//    treat(patient);
}

-(void)treatment:(YKTreatBlock)treatBlock {//(void(^)(YKPatient12HW *patient))treatBlock {
//    treatBlock = ^(YKPatient12HW *self){
//        NSLog(@"~~~Doctor: 'I treatment you %@! Relax!'", self.name);
//    };
    
    treatBlock(self);
    for (int i = 0; i < 2; ) {
        if (healthStatus) {
            NSLog(@"~~~Doctor: %@ you are H E A L T H!!!!! \n ", self.name);
            i = 2 ;
        }
    
        if (!healthStatus) {
            NSLog(@"%@ STILL at Hospital", self.name);
            treatBlock(self);
            i = 0;
        }
    }
}

-(void)treatmentV2:(void(^)(YKPatient12HW *patient))treatBlockV2 {  //версия 2 проба без тайпдефа
    NSLog(@"%@: Am I sick?", self.name);
    healthStatus = [self randomStatus];
    if (healthStatus) {
        NSLog(@"~~~Doctor says: Dont worry %@! Just %@",self.name, [self randomStatus] ? @"TAKE A PILL" : @"MAKE A SHOT");
    }
    
    if (!healthStatus) {
        NSLog(@"~~~Doctor says: %@ you have a problem! Doctor hospitalize me!", self.name);
        treatBlockV2(self);
    }
    
//    treatBlockV2 = ^(YKPatient12HW *patient){
//        NSLog(@"~~~Doctor: 'I treatment you %@ Relax and take it easy!'", patient.name);
////        [patient randomStatus];
//    };
    
    
    for (int i = 0; i < 2; ) {
        
        if (healthStatus) {
            NSLog(@"~~~Doctor: %@ you are H E A L T H!!!!! \n ", self.name);
            i = 2 ;
        }
        
        if (!healthStatus) {
            NSLog(@"%@ STILL at Hospital", self.name);
            treatBlockV2(self);
            i = 0;
        }
    }
}


- (BOOL)randomStatus {
    return arc4random_uniform(2);
}

- (NSUInteger)randomTime {
    return arc4random_uniform(10) + 5;
}
@end

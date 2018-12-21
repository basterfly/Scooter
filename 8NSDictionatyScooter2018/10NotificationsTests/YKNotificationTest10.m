//
//  YKNotificationTest10.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.09.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKNotificationTest10.h"
#import "YKGovernment.h"
#import "YKDoctor10.h"
#import "YKBusinessman10hw.h"
#import "YKPensioner10hw.h"

@interface YKNotificationTest10 ()              //Category!!! расшыряем свой класс

@property (strong, nonatomic) YKGovernment *government;

@property (strong, nonatomic) YKDoctor10 *doctor;
//@property (strong, nonatomic) YKBusinessman10hw *businessman2;

@end

@implementation YKNotificationTest10

- (void) notificationTest {
    self.government = [[YKGovernment alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:YKGovernmentTaxLevelDidChangeNotification
                                               object:nil];
    
    YKDoctor10 *doctor1 = [[YKDoctor10 alloc] init];
//    YKDoctor10 *doctor2 = [[YKDoctor10 alloc] init];
//    YKDoctor10 *doctor3 = [[YKDoctor10 alloc] init];
//    YKDoctor10 *doctor4 = [[YKDoctor10 alloc] init];
//    YKDoctor10 *doctor5 = [[YKDoctor10 alloc] init];
    
//    doctor1.salary = doctor2.salary = doctor3.salary = doctor4.salary = doctor5.salary = self.government.salary;
    doctor1.salary = self.government.salary;
    doctor1.averagePrice = self.government.averagePrice;
    
    YKBusinessman10hw *businessman1 = [[YKBusinessman10hw alloc] init];
    businessman1.taxLevel = self.government.taxLevel;
    businessman1.averagePrice = self.government.averagePrice;
    
    YKPensioner10hw *pensioner = [[YKPensioner10hw alloc] init];
    pensioner.pension = self.government.pension;
    pensioner.averagePrice = self.government.averagePrice;
    
    self.doctor = [[YKDoctor10 alloc] init];
//    self.businessman2 = [[YKBusinessman10hw alloc] init];
    
    
    self.government.taxLevel = 5.5f;
    self.government.salary = 1100;
    self.government.pension = 550;
    self.government.averagePrice = 12;
    
    self.government.taxLevel = 5.7f;
    self.government.salary = 1120;
    self.government.pension = 550;
    self.government.averagePrice = 15;
    
    self.government.salary = 1050;
    self.government.pension = 560;
    self.government.averagePrice = 13;
    
    self.government.salary = 1150;
    self.government.averagePrice = 17;
    
    self.government.salary = 1200;
    self.government.averagePrice = 20;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:YKGovernmentTaxLevelDidChangeNotification
                                                  object:nil]; //удаляет только конктерную нотификацию
    [[NSNotificationCenter defaultCenter] removeObserver:self]; //удаляет все нотификации
}

- (void) governmentNotification:(NSNotification *)notification {
    NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
}

@end

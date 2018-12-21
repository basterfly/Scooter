//
//  YKBlocksHW.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 20.11.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKBlocksHW.h"
#import "YKStudentHW12.h"
#import "YKPatient12HW.h"

typedef void (^YKBlocks1WithParam)(NSString *);
typedef NSUInteger (^YKBlocks2WithReturns) (NSString *);



@implementation YKBlocksHW

- (void)blocksHW {
    void (^blockHW)(void) = ^{
        NSLog(@"BlockHW - %@ object", self);
    };
    
    blockHW();
//    2
    void (^blockWithParamNW)(NSString *, NSUInteger);
    blockWithParamNW = ^(NSString *str, NSUInteger nsuint){
        NSString *string = [NSString stringWithFormat:@"block2 %@ + %ld", str, nsuint];
        NSLog(@"%@", string);
    };
    
    blockWithParamNW(@"str", 2);
    
//    3
    YKBlocks1WithParam block1WithParam = ^(NSString *str){
        NSLog(@"%@",str);
    };

    __block NSUInteger length;
    YKBlocks2WithReturns block2WithReturns = ^(NSString *str){
        NSLog(@"%@", str);
        length = [str length];
        return length;
    };
    
    block1WithParam(@"I am a programmer");
    block2WithReturns(@"Programmer");
    NSLog(@"%ld - characters / letters", length);
 
//    4
//    block2WithReturns(@"block2WithReturns in method");
    YKBlocksHW *blockTestObj = [[YKBlocksHW alloc] init];
    [blockTestObj methodWithBlockAndReturns:block2WithReturns];
    
//    5 6 7 8
    NSLog(@"~~~5 6 7 8 Student~~~");
    
    YKStudentHW12 *student1 = [[YKStudentHW12 alloc] init];
    student1.name = @"Yehor";
    student1.lastName = @"Kozlovskiy";
    YKStudentHW12 *student2 = [[YKStudentHW12 alloc] init];
    student2.name = @"Ivan";
    student2.lastName = @"Petrov";
    YKStudentHW12 *student3 = [[YKStudentHW12 alloc] init];
    student3.name = @"Ivan";
    student3.lastName = @"Vodkin";
    YKStudentHW12 *student4 = [[YKStudentHW12 alloc] init];
    student4.name = @"Sergey";
    student4.lastName = @"Borisov";
    YKStudentHW12 *student5 = [[YKStudentHW12 alloc] init];
    student5.name = @"Boris";
    student5.lastName = @"Sergeev";
    YKStudentHW12 *student6 = [[YKStudentHW12 alloc] init];
    student6.name = @"Anton";
    student6.lastName = @"Rybak";
    YKStudentHW12 *student7 = [[YKStudentHW12 alloc] init];
    student7.name = @"Andriy";
    student7.lastName = @"Potyshniak";
    YKStudentHW12 *student10 = [[YKStudentHW12 alloc] init];
    student10.name = @"Mykyta";
    student10.lastName = @"Ivanov";
    YKStudentHW12 *student9 = [[YKStudentHW12 alloc] init];
    student9.name = @"Nikita";
    student9.lastName = @"Koshikov";
    YKStudentHW12 *student8 = [[YKStudentHW12 alloc] init];
    student8.name = @"Serhiy";
    student8.lastName = @"Ivanov";
    NSArray *students = @[student1, student2, student3, student4, student5, student6, student7, student8, student9, student10];
    for (id student in students) {
        NSLog(@"%@ %@\n", [student name], [student lastName]);
    }

    NSLog(@"Sorted Students ~~~~~\nName Lastname:");
//    NSArray *sortedArray = [[NSArray alloc] init];
//    for (uint index = 0; index < [students count]; index++) {
//        sortedArray = [students sortedArrayUsingComparator: ^(id obj0, id obj1) {
//            if ([obj0 lastName] > [obj1 lastName]) {
//                return (NSComparisonResult)NSOrderedDescending;
//            }
//
//            return (NSComparisonResult)NSOrderedSame;
//        }];
//    }
    
    NSArray *sortedStudents = [[NSArray alloc] init];
    for (uint yindex = 0; yindex < [students count]; yindex++) {
        sortedStudents = [students sortedArrayUsingComparator: ^(id obj0, id obj1) {
            if ([obj0 lastName] > [obj1 lastName]) {
                return [[obj0 lastName] compare:[obj1 lastName]];
            }
            
            if ([obj0 lastName] < [obj1 lastName]) {
                return [[obj0 lastName] compare:[obj1 lastName]];
            }
            
            if ([obj0 lastName] == [obj1 lastName]) {
                return [[obj0 name] compare:[obj1 name]];
            }
            
            return (NSComparisonResult)NSOrderedSame;
        }];
    }
    
    
    for (id student in sortedStudents) {
        NSLog(@"%@ %@\n", [student name], [student lastName]);
    }
    
//    9
    NSLog(@"~~~9 Мастер~~~");
    
    NSMutableArray *patients = [[NSMutableArray alloc] init];   ///*
    for (NSUInteger index = 1; index < 11; index++) {
        YKPatient12HW *patient = [[YKPatient12HW alloc] init];
        patient.name = [NSString stringWithFormat:@"Patient%lu", (unsigned long)index];
        patient.healthStatus = [patient randomStatus];
        [patients addObject:patient];
    }
    
    NSLog(@"Patients: %@", patients);
    for (YKPatient12HW *patient in patients) {
        NSLog(@"~~~Are You OK?");
        [patient areYouOk:patient];
        if (patient.healthStatus) {
            NSLog(@"~~~OK!");
        }
        
        if (!patient.healthStatus) {
            NSLog(@"~~~What are you waiting for?!!! You need  to treat! I check you!");
            [patient iAmSick:patient];
        }
    }   //*/
    
//    V2
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~9 PATIENTS V 2");//версия 2 проба без тайпдефа и передаем блок как переменную в методе, ВСЕ ГУД
/*
    [patients removeAllObjects];
    for (NSUInteger index = 1; index < 11; index++) {
        YKPatient12HW *patient = [[YKPatient12HW alloc] init];
        patient.name = [NSString stringWithFormat:@"Patient%lu", (unsigned long)index];
        patient.healthStatus = [patient randomStatus];
        [patients addObject:patient];
    }
    
    void(^treatBlockV2)(YKPatient12HW *) = ^(YKPatient12HW *patient){
        //            NSLog(@"~~~Doctor: 'I treatment you %@! Relax!'", self.name);
        NSLog(@"~~~Doctor: 'I treatment you %@ Relax and take it easy!'", patient.name);
        patient.healthStatus = [patient randomStatus];
    };
    
    NSLog(@"Patients: %@", patients);
    for (YKPatient12HW *patient in patients) {
        NSLog(@"~~~Are You OK?");
        [patient areYouOk:patient];
        if (patient.healthStatus) {
            NSLog(@"~~~OK!");
        }
        
        if (!patient.healthStatus) {
            NSLog(@"~~~What are you waiting for?!!! You need  to treat! I check you!");
            [patient treatmentV2:treatBlockV2];
        }
    }
 */
    NSLog(@"~~~13 14 Superman~~~");
    
    [patients removeAllObjects];
    for (NSUInteger index = 1; index < 11; index++) {
        YKPatient12HW *patient = [[YKPatient12HW alloc] init];
        patient.name = [NSString stringWithFormat:@"Patient%lu", (unsigned long)index];
        patient.healthStatus = [patient randomStatus];
        [patients addObject:patient];
    }
    
    void(^treatBlockV2)(YKPatient12HW *) = ^(YKPatient12HW *patient){
        //            NSLog(@"~~~Doctor: 'I treatment you %@! Relax!'", self.name);
        NSLog(@"~~~Doctor: 'I treatment you %@ Relax and take it easy!'", patient.name);
        patient.healthStatus = [patient randomStatus];
    };
    
    NSLog(@"Patients: %@", patients);
    for (YKPatient12HW *patient in patients) {
        NSLog(@"~~~Are You OK?");
//        [patient areYouOk:patient];
//        if (patient.healthStatus) {
//            NSLog(@"~~~OK!");
//        }
        
//        if (!patient.healthStatus) {
//            NSLog(@"~~~What are you waiting for?!!! You need  to treat! I check you!");
//            [patient treatmentV2:treatBlockV2];
//        }
    }
    
}


- (NSUInteger)methodWithBlockAndReturns:(YKBlocks2WithReturns)block2WithReturns {
    NSLog(@"~~~~~~~~~~~~~methodWithBlockAndReturns");
    NSUInteger length;
    block2WithReturns(@"block2WithReturns in method");  //просто вызываем
    NSString * string = [NSString stringWithFormat:@"%ld", block2WithReturns(@"block2WithReturns in method")];  //вызов и получение возвращаемого значения как строку
    length = [string intValue]; //конвертируем в число
    NSLog(@"%ld", block2WithReturns(@"block2WithReturns in method"));   //вызов и получение возвращаемого значения
    return length;
}

@end

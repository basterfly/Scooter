//
//  YKBitsTests.m
//  Skutarenko2019
//
//  Created by Egor Kozlovskiy on 1/23/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import "YKBitsTests.h"
#import "YKStudentTest.h"

@implementation YKBitsTests

-(void)bitsTests {
    YKStudentTest *student = [[YKStudentTest alloc] init];
    
//  такая форма записи не используется т.к. это не очень удобно 
    /*
     student.studiesBiology = @"YES";
     student.studiesMath = @"YES";
     student.studiesDevelopment = @"YES";
     student.studiesEngineering = @"YES";
     student.studiesArt = @"NO";
     student.studiesPsychology = @"NO";
     student.studiesAnatomy = @"NO";
     NSLog(@"%@ ", student);
     */
    
    student.subjectType  =  YKStudentSubjectTypeAnatomy | YKStudentSubjectTypePsychology |
    YKStudentSubjectTypeMath |YKStudentSubjectTypeBiology;
    NSLog(@"%@ ", student);
}

@end

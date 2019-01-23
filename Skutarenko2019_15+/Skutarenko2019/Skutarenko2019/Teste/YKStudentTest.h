//
//  YKStudentTest.h
//  Skutarenko2019
//
//  Created by Egor Kozlovskiy on 1/21/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    YKStudentSubjectTypeBiology         = 1 << 0,
    YKStudentSubjectTypeMath            = 1 << 1,
    YKStudentSubjectTypeDevelopment     = 1 << 2,
    YKStudentSubjectTypeEngineering     = 1 << 3,
    YKStudentSubjectTypeArt             = 1 << 4,
    YKStudentSubjectTypePsychology      = 1 << 5,
    YKStudentSubjectTypeAnatomy         = 1 << 6
}YKStudentSubjectType;

@interface YKStudentTest : NSObject
@property (assign, nonatomic) YKStudentSubjectType subjectType;

//  такая форма записи не используется т.к. это не очень удобно 
/*
@property (assign, nonatomic) BOOL studiesBiology;
@property (assign, nonatomic) BOOL studiesMath;
@property (assign, nonatomic) BOOL studiesDevelopment;
@property (assign, nonatomic) BOOL studiesEngineering;
@property (assign, nonatomic) BOOL studiesArt;
@property (assign, nonatomic) BOOL studiesPsychology;
@property (assign, nonatomic) BOOL studiesAnatomy;
*/
@end

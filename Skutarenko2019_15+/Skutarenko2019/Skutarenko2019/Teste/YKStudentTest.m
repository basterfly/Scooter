//
//  YKStudentTest.m
//  Skutarenko2019
//
//  Created by Egor Kozlovskiy on 1/21/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import "YKStudentTest.h"

@implementation YKStudentTest

//чтобы не дублировать код - так должно быть всегда!!!
- (NSString *)answerByType:(YKStudentSubjectType)type {
    return self.subjectType & type ? @"YES" : @"NO";
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Student studies: \n"
            "Biology - %@\n"
            "Math - %@\n"
            "Development - %@\n"
            "Engineering - %@\n"
            "Art - %@\n"
            "Psychology - %@\n"
            "Anatomy - %@\n", self.subjectType & YKStudentSubjectTypeBiology ? @"YES" : @"NO",
            self.subjectType & YKStudentSubjectTypeMath ? @"YES" : @"NO",
            self.subjectType & YKStudentSubjectTypeDevelopment ? @"YES" : @"NO",
            [self answerByType:YKStudentSubjectTypeEngineering],
            [self answerByType:YKStudentSubjectTypeArt],
            [self answerByType:YKStudentSubjectTypePsychology],
            [self answerByType:YKStudentSubjectTypeAnatomy]];
}

//  такая форма записи не используется т.к. это не очень удобно 
/*
- (NSString *)description {
    return [NSString stringWithFormat:@"Student studies: \n"
            "Biology - %@\n"
            "Math - %@\n"
            "Development - %@\n"
            "Engineering - %@\n"
            "Art - %@\n"
            "Psychology - %@\n"
            "Anatomy - %@\n", self.studiesBiology ? @"YES" : @"NO",
                            self.studiesMath ? @"YES" : @"NO",
                            self.studiesDevelopment ? @"YES" : @"NO",
                            self.studiesEngineering ? @"YES" : @"NO",
                            self.studiesArt ? @"YES" : @"NO",
                            self.studiesPsychology ? @"YES" : @"NO",
                            self.studiesAnatomy ? @"YES" : @"NO"];
}*/

@end

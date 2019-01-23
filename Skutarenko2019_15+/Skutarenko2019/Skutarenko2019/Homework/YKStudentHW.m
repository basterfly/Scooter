//
//  YKStudentHW.m
//  Skutarenko2019
//
//  Created by Egor Kozlovskiy on 1/22/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import "YKStudentHW.h"

@interface YKStudentHW()
//@property (readwrite, strong, nonatomic) NSString *name;
@end

@implementation YKStudentHW

- (NSString *)studentGotClass:(YKStudentHWClassType)classSubject {
    return self.typeOfClass & classSubject ? @"YES" : @"NO";
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ have classes:\n"
            "English - %@\n"
            "MAth - %@\n"
            "Programming - %@\n"
            "Engineering - %@\n"
            "History - %@\n"
            "Design - %@\n"
            "Chemestry - %@\n"
            "Biology - %@\n", self.name,
                            [self studentGotClass: YKStudentHWClassTypeEnglish],
                            [self studentGotClass: YKStudentHWClassTypeMAth],
                            [self studentGotClass: YKStudentHWClassTypeProgramming],
                            [self studentGotClass: YKStudentHWClassTypeEngineering],
                            [self studentGotClass: YKStudentHWClassTypeHistory],
                            [self studentGotClass: YKStudentHWClassTypeDesign],
                            [self studentGotClass: YKStudentHWClassTypeChemestry],
                            [self studentGotClass: YKStudentHWClassTypeBiology]];
}

@end

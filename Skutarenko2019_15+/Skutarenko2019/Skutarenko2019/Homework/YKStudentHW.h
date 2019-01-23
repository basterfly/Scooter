//
//  YKStudentHW.h
//  Skutarenko2019
//
//  Created by Egor Kozlovskiy on 1/22/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    YKStudentHWClassTypeEnglish         = 1 << 0,
    YKStudentHWClassTypeMAth            = 1 << 1,
    YKStudentHWClassTypeProgramming     = 1 << 2,
    YKStudentHWClassTypeEngineering     = 1 << 3,
    YKStudentHWClassTypeHistory         = 1 << 4,
    YKStudentHWClassTypeDesign          = 1 << 5,
    YKStudentHWClassTypeChemestry       = 1 << 6,
    YKStudentHWClassTypeBiology         = 1 << 7
}YKStudentHWClassType;

@interface YKStudentHW : NSObject
@property (assign, nonatomic) YKStudentHWClassType typeOfClass;
@property (strong, nonatomic) NSString *name;
@end


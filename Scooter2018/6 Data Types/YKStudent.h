//
//  YKStudent.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 03.04.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {                  //enum не нумерованый список
    YKGenderMale = 0,           //все поля в списке нумеруются
    YKGenderFemale = 1
} YKGender;                     //наш тип списка, данных в списке

typedef NSInteger YKTaburetka; //мы говорим что наш новый тип данных YKTaburetka это NSInteger

@interface YKStudent : NSObject

@property (strong, nonatomic) NSString *name;
//@property (assign, nonatomic) BOOL isMAle; -->
@property (assign, nonatomic) YKGender gender;

@end

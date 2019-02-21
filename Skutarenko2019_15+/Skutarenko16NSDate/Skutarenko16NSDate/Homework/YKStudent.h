//
//  YKStudent.h
//  Skutarenko16NSDate
//
//  Created by Egor Kozlovskiy on 2/17/19.
//  Copyright © 2019 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKStudent : NSObject
@property (strong, nonatomic) NSDate    *dateOfBirth;
@property (strong, nonatomic) NSString  *name;
@property (strong, nonatomic) NSString  *lastName;
@property (assign, nonatomic) NSInteger age;

- (NSString *)setName;
- (NSString *)setLastName;

@end

//
//  YKStudent.h
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 14.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKStudent : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *speech;

- (NSString *) description; // !!!!!!!see docu!!! метод который выводит информацию об обьекте
- (NSString *) fullName;
- (NSString *) studentID;


@end

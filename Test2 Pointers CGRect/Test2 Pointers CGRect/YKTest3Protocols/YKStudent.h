//
//  YKStudent.h
//  Test2 Pointers CGRect
//
//  Created by Egor on 09.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKPatient.h"

@interface YKStudent : NSObject <YKPatient>

@property (strong, nonatomic) NSString *universityName;
@property (strong, nonatomic) NSString *name;

- (void) study;

@end

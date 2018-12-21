//
//  YKStudent7.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 23.05.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKPatient.h"

@interface YKStudent7 : NSObject <YKPatient>

@property (strong, nonatomic) NSString *universityName;
@property (strong, nonatomic) NSString *name;

- (void) study;
@end

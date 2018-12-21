//
//  YKDeveloper7.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 23.05.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YKPatient.h"

@interface YKDeveloper7 : NSObject <YKPatient>

@property (assign, nonatomic) CGFloat experience;
@property (strong, nonatomic) NSString *name;

- (void) work;

@end

//
//  YKDeveloper.h
//  Test2 Pointers CGRect
//
//  Created by Egor on 09.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YKPatient.h"

@interface YKDeveloper : NSObject <YKPatient>

@property (assign, nonatomic) CGFloat experience;
@property (strong, nonatomic) NSString *name;

- (void) work;

@end

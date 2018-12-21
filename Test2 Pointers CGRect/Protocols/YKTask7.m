//
//  YKTask7.m
//  Test2 Pointers CGRect
//
//  Created by Egor on 27.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKTask7.h"
//#import "YKJumpers.h"
//#import "YKRunners.h"
//#import "YKSwimmer.h"

#import "YKRunner.h"
#import "YKSwimmer.h"
#import "YKTriathlon.h"
#import "YKAccountant.h"

@implementation YKTask7

+ (void) task7 {
    NSLog(@"~~~~~~~~~~~~~~~HOME TASK 7 Protocols~~~~~~~~~~~~~~~~");
    YKSwimmer *swimmer = [[YKSwimmer alloc] init];
    YKRunner *runner = [[YKRunner alloc] init];
    YKTriathlon *triatloner = [[YKTriathlon alloc] init];
    YKAccountant *accountant = [[YKAccountant alloc] init];
    
    NSArray *sportsMans = [NSArray arrayWithObjects: triatloner, runner, swimmer, accountant, nil];
    NSArray *sportsMans1 = @[swimmer, runner, triatloner, accountant];
    for (/* NSObject * */ id <YKJumpers, YKRunners, YKSwimmers> sportMan in sportsMans) {
        if ([sportMan respondsToSelector:@selector(jump)]) {
            [sportMan jump];
        }
        //        [sportMan jump];
    }
}

@end

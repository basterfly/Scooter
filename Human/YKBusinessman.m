//
//  YKBusinessman.m
//  Scooter1
//
//  Created by Egor on 22.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import "YKBusinessman.h"

@interface YKBusinessman ()
@property (nonatomic, strong)   NSString *earlyWakeup;

@end

@implementation YKBusinessman

- (void)movement {
    NSLog(@"%@ %@", self.name,[self earlyWakeup]);
    NSLog(@"%@ like a ", self.name);
    [super movement];
    NSLog(@"But, so many different movements a day!");
}

- (NSString *)earlyWakeup {
    return  @" earlyWakeup";
}
@end

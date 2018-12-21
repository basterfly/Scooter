//
//  YKTriathlon.h
//  Test2 Pointers CGRect
//
//  Created by Egor on 27.10.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKSwimmers.h"
#import "YKJumpers.h"
#import "YKRunners.h"

@interface YKTriathlon : NSObject <YKSwimmers, YKJumpers, YKRunners>

@property (nonatomic, assign) NSUInteger count;

@end

//
//  YKSportsman.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 22.06.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKJumpers.h"
#import "YKSwimmers.h"
#import "YKRunners.h"

@interface YKSportsman : NSObject <YKJumpers, YKSwimmers, YKRunners>

@property (assign, nonatomic) CGFloat valueJumpHight;
@property (assign, nonatomic) CGFloat valueJumpLength;

@end

//
//  YKBoxer.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 26.02.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // import for CGFloat!

@interface YKBoxer : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSUInteger age;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;


- (NSUInteger) howOldAreYou;

@end

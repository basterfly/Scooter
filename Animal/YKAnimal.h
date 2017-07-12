//
//  YKAnimal.h
//  Scooter1
//
//  Created by Egor on 28.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKAnimal : NSObject
@property (nonatomic, strong)   NSString    *movePosition;
@property (nonatomic, assign)   NSUInteger  countOfLegs;
@property (nonatomic, strong)   NSString    *name;

- (void)movement;
- (void)type;

@end

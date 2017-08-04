//
//  YKAnimal.h
//  Scooter1
//
//  Created by Egor on 28.06.17.
//  Copyright © 2017 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    horizontal,
    vertical
} YKmovePosition;

@interface YKAnimal : NSObject
@property (nonatomic, assign)   YKmovePosition      movePosition;
@property (nonatomic, assign)   NSUInteger          countOfLegs;
@property (nonatomic, strong)   NSString            *name;

- (void)movement;
- (void)type;

@end

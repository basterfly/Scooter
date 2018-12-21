//
//  YKBlockObject.h
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 13.11.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ObjectBlock)(void);

@interface YKBlockObject : NSObject

@property (strong, nonatomic) NSString *name;

- (void)testMethod:(ObjectBlock)block;
@end

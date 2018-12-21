//
//  YKBlocksTests.h
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 30.10.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKBlocksTests : NSObject
- (void)blocksTests;
- (void)testBlocksMethod:(void (^)(void))block;
@end

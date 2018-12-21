//
//  YKBlockObject.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 13.11.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKBlockObject.h"

@interface YKBlockObject ()

@property (copy, nonatomic) ObjectBlock objectBlock; //1)наш обьект держит стронг ссылкой наш блок

@end

@implementation YKBlockObject
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.objectBlock = ^{
            __weak YKBlockObject *weakSelf = self;  // 3) поэтому делаем ссылку на обьект __weak
            
//            NSLog(@"%@ in method init",self.name);  //2)а наш блок стронг ссылкой держит наш обьект, и он никогда не будет уничтожен. мы retain`им self!
            NSLog(@"%@ in method init", weakSelf.name);  //4) делаем weak чтобы обьект освобождался
        };
    }
 
    return self;
}

- (void)dealloc {
    NSLog(@"%@ is deallocated", self);
}

- (void)testMethod:(ObjectBlock)block {
    block();
}
@end


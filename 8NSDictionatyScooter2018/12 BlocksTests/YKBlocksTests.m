//
//  YKBlocksTests.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 30.10.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YKBlocksTests.h"
#import "YKBlockObject.h"

typedef void (^TestTypedefBlock2) (void);
typedef NSString* (^TestTypedefBlock3) (NSUInteger);
typedef void (^TestTypedefBlock4) (void);

@interface YKBlocksTests ()

@property (copy, nonatomic) TestTypedefBlock4 typedefBlock4; //Делаять property для блока всегда только copy! Тогда блок попадает в кучу(heap) и он будет хранится со всеми обьектами,
// в противном случае если этого не сделать то обьект будет уничтожен по завершеню блока или метода.
@property (strong, nonatomic) NSString *name;

@end

@implementation YKBlocksTests

- (void)blocksTests {
//    blockTest
    void (^blockTest)(void);
    blockTest = ^{
        NSLog(@"blocksTests");
    };
    
    blockTest();
    
//    blockWithParams
    void (^blockWithParams)(NSString*, NSInteger) = ^(NSString *string, NSInteger intValue){
        NSLog(@"blockWithParams : string - %@; intValue - %ld", string, (long)intValue);
    };
    
    blockWithParams(@"TEST", 111);
    
//    blockWithRreturnAndParams
    NSString* (^blockWithRreturnAndParams)(NSString*, NSInteger) = ^(NSString *string, NSInteger intValue){
        NSString *returnString = [NSString stringWithFormat:@"blockWithRreturnAndParams : %@ - %ld",string, intValue];
        return returnString;
    };
    
    blockWithRreturnAndParams(@"TEST", 111);
    
    
    NSString *string1 = @"String1";
    NSUInteger intY = 3;
    __block NSString *string2 = @"String2"; //переменная которая будет изменятся в блоке
    __block NSUInteger intX = 0; //переменная которая будет изменятся в блоке
    
    void (^testBlock2)(void) = ^{
        NSLog(@"Does not changed string and value: %@ - %lu", string1, intY);
        intX = intX + 1;
        string2 = [NSString stringWithFormat:@"%@ changed %lu times", string2, intX];
        NSLog(@"%@", string2);
    };
    
    testBlock2();
    testBlock2();
    testBlock2();
    testBlock2();
    testBlock2();
    
    /*
    NSComparisonResult (^bbb)(id, id) = ^(id obj1, id obj2){
        return NSOrderedAscending;
    };
    NSArray *array = [[NSArray alloc] init];
    array = [array sortedArrayUsingComparator:bbb];
    */
    
    //методы могут принимать блоки как параметры
    //V.1
    [self testBlocksMethod:^{
        NSLog(@"BLOCK!!!");
    }];
    
    //V.2
    void (^block)(void) = ^{
        NSLog(@"BLOCK INITIALIZING!!!");
    };
    
    [self testBlocksMethod:block];
    
//    блок можно сделать типом для удобства и сокращения написания (см. вверх) typedef
    TestTypedefBlock2 typedefBlock2 = ^{
        NSLog(@"typedefBlock2");
    };
    
    TestTypedefBlock3 typedefBlock3 = ^(NSUInteger value){
        return [NSString stringWithFormat:@"%lu", value];
    };
    
    [self testBlocksMethod:typedefBlock2];
    
    NSLog(@"%@", typedefBlock3(123));
    
    
//   v.1
    YKBlockObject *obj1 = [[YKBlockObject alloc] init];
    obj1.name = @"OBJECT_1";
    TestTypedefBlock4 typedefBlock4 = ^{
        NSLog(@"Obj name is: %@", obj1.name);
    };

    typedefBlock4();

    
//   v.2
    YKBlockObject *obj2 = [[YKBlockObject alloc] init];
    obj2.name = @"OBJECT_2";
    self.typedefBlock4 = ^{                     //т.к. на этот блок у нас сделано проперти, то на него устанавливается стронг ссылка
        NSLog(@"Obj name is: %@", obj2.name);
    };

    self.typedefBlock4();                       // поэтому обьект который вызывается в данном блоке тоже имеет стронг ссылку и не умирает
    
//    __weak YKBlockObject *weakObject = obj2;  //устанавливается weak ссылка на обьект и он соответственно умрет когда закончится выполнение блока
//    self.typedefBlock4 = ^{
//        NSLog(@"Obj name is: %@", weakObject.name);
//    };
//
//    self.typedefBlock4();
    
    self.name = @"Hello";
    
    YKBlockObject *lastObject = [[YKBlockObject alloc] init];
    lastObject.name = @"lastObject";
    [lastObject testMethod:^{
        NSLog(@"%@", self.name); // self  - это обьект класса appdelegate, вызовится имя обьекта self.name = @"Hello";
    }];
}

   //методы могут принимать блоки как параметры
- (void)testBlocksMethod:(void (^)(void))block {
    NSLog(@"testBlocksMethod");
    block();
}

//- (void)testBlocksMethod3:(NSString* (^)(NSUInteger))block {
//    NSLog(@"testBlocksMethod3");
//    NSLog(@"%@", typedefBlock3(123));
//}

@end

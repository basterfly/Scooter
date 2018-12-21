//
//  YKTest.h
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 28.02.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YKObject; // директива @class говорит что такой класс уже существует и где то объявлен, используй не боись

@interface YKTest : NSObject


//@property (strong, nonatomic) YKObject *object;
@property (copy, nonatomic) YKObject *object; // при создании обьекта с параметром copy задается обьект и сразуже создается его копия, копия присваеваится указателю или переменной а оригинал удаляется т.к. на него не указывает ни одна СТРОНГ ссылка, она указывает на КОПИ

+ (void) videoTest1;
+ (void) videoTest2;
+ (void) videoTest3;
+ (void) testArray;
+ (void) testDataTypes;
+ (void) testProtocols;

@end

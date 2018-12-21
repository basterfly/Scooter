//
//  YKTest.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 28.02.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKTest.h"
#import "YKParentClass.h"
#import "YKChildClass.h"
#import "YKBoxer.h"
#import "YKObject.h"
#import "YKArrayObject.h"
#import "YKArrChild.h"
#import "YKStudent.h"

#import "YKPatient.h"
#import "YKStudent7.h"
#import "YKDeveloper7.h"
#import "YKDancer7.h"

@implementation YKTest

+ (void) videoTest1 {
    YKParentClass *parent = [[YKParentClass alloc] init];
    
    [parent hello];
    
    [parent say:@"How are you?"];
    
    [parent say:@"I was worried about you" and:@"Where have you been?"];
    
    [parent say:@"Hope you are OK!" and:@"Are you?" andAfterThat:@"Are you sure?"];
    
    NSLog(@"%@", [parent saySomething]);
    
    [YKParentClass whoAreYou];
    
    YKChildClass *child = [[YKChildClass alloc] init]; //наследование
    NSLog(@"%@", [child saySomething]); //запускается переопределнный метод у child
    NSLog(@"%@", [child saySomeString]); // метод child`a вызывает метод родителя
    
}

+ (void) videoTest2 {
    //~~Properties~~
    YKBoxer *boxer = [[YKBoxer alloc] init];
    //    boxer.nameCount = 0; сделали проперти внутренним и теперь nameCount не виден
    
    //    boxer.name = @"Vasiliy";
    //    boxer.age = 25;
    //    boxer.height = 1.8f;
    //    boxer.weight = 80.f;
    
    [boxer setName:@"Vasiliy"];//при создании проперти были созданы и методы сеттеры
    [boxer setAge:25];
    [boxer setHeight:1.8];
    [boxer setWeight:80.0];
    
    //    NSLog(@"boxer name - %@", boxer.name);
    //    NSLog(@"boxer age - %lu", boxer.age);
    //    NSLog(@"boxer height - %f", boxer.height);
    //    NSLog(@"boxer weight - %f", boxer.weight);
    
    NSLog(@"boxer name - %@", [boxer name]); //а также при создании проперти были созданы геттеры
    NSLog(@"boxer age - %lu", [boxer age]);
    NSLog(@"boxer height - %f", [boxer height]);
    NSLog(@"boxer weight - %f", [boxer weight]);
    
    NSLog(@"boxer how old are you? My age - %lu", [boxer howOldAreYou]);
    NSLog(@"boxer name - %@", boxer.name);
    NSLog(@"boxer name - %@", [boxer name]);
}

+ (void) videoTest3 {
    YKTest *testObj = [[YKTest alloc] init];
    [testObj testObject];
}

- (void) testObject { //        from appDeleggate to  test moved
    [self selfTestObject];
    
    //    self.object = nil;
    self.object = [[YKObject alloc] init];
    
    NSLog(@"Test is over");
}

- (void) selfTestObject {
    YKObject *obj = [[YKObject alloc] init];
    self.object = obj; // или [self object:obj];
}

+ (void) testArray {
//    NSArray *array = [[NSArray alloc] initWithObjects:@"String 1", @"String 2", @"String 3", nil]; //v1
//    NSArray *array = [NSArray arrayWithObjects:@"String 1", @"String 2", @"String 3", nil]; //v2
    NSArray *array = @[@"String 1", @"String 2", @"String 3"]; //v3
    
//    for (int i = 0; i < 3; i++) {
    for (int i = 0; i < [array count]; i++) {
        NSLog(@"%@", [array objectAtIndex:i]);
        NSLog(@"i = %d", i);
    }
    
    NSLog(@"For Reverse");
    for (int i = [array count] - 1; i >= 0; i--) {
        NSLog(@"%@", [array objectAtIndex:i]);
        NSLog(@"%d", i);
    }
    NSLog(@"For IN");
    for (NSString *string in array) {
        NSLog(@"%@", string);
        NSLog(@"index = %d", [array indexOfObject:string]);
    }
    
    YKArrayObject *arObject1 = [[YKArrayObject alloc] init];
    YKArrayObject *arObject2 = [[YKArrayObject alloc] init];
    YKArrChild *arObject3 = [[YKArrChild alloc] init];
    
    arObject1.name = @"Object1";
    arObject2.name = @"Object2";
    [arObject3 setName:@"Object3"];
    arObject3.lastName = @"Last name of Child";
    
    NSArray *arrayObjects = [NSArray arrayWithObjects: arObject1, arObject2, arObject3, nil];
    for (YKArrayObject *obj in arrayObjects) {
        NSLog(@"name %lu = %@", (unsigned long)[arrayObjects count], obj.name);
        [obj action];
        if ([obj isKindOfClass:[YKArrChild class]]) {
            YKArrChild *child = (YKArrChild *)obj;
            NSLog(@"last name = %@", child.lastName);
        }
    }
}

+ (void) testDataTypes {
    BOOL boolVar = YES;
    NSInteger intVar = 10;
    NSUInteger uintVar = 100;
    CGFloat cgFloatVAr = 1.5f;
    double doubleVar = 2.5f;
    
    NSLog(@"boolVar - %d, intVar - %d, uintVar - %d, cgFloatVAr - %f, doubleVar - %f", boolVar, intVar, uintVar, cgFloatVAr, doubleVar);
    NSLog(@"boolVar - %ld, intVar - %ld, uintVar - %ld, cgFloatVAr - %ld, doubleVar - %ld", sizeof(boolVar), sizeof(intVar), sizeof(uintVar), sizeof(cgFloatVAr), sizeof(doubleVar));
    
    YKStudent *studentA = [[YKStudent alloc] init];
//    studentA.isMale = NO;
//    studentA.gender = YKGenderFemale; // or -->
    [studentA setGender:YKGenderFemale];
    
    YKTaburetka t = 10; //созданый нами тип табуретка который на самом деле является интом
    
    //3 самы :) Структуры!!! лучше делать класс чем создовать структуры
    CGPoint point;
    point.x = 5.5f;
    point.y = 10;
    point = CGPointMake(6.5, 11);
    
    CGSize size;
    size.width = 10;
    size.height = 5;
    size = CGSizeMake(11, 6);
    
    CGRect rect;
    rect.origin = point;
    rect.size = size;
    rect = CGRectMake(0, 0, 30, 60);
    
    BOOL result = CGRectContainsPoint(rect, point); //содержит ли прямоугольник точку?
    
    NSNumber *boolObject = [NSNumber numberWithBool:boolVar];
    NSNumber *intObject = [NSNumber numberWithInteger:intVar];
    NSNumber *uintObject = [NSNumber numberWithUnsignedInt:uintVar];
    NSNumber *floatObject = [NSNumber numberWithFloat:cgFloatVAr];
    NSNumber *doubleObject = [NSNumber numberWithDouble:doubleVar];
    
    NSArray *array = [NSArray arrayWithObjects:boolObject, intObject, uintObject, floatObject, doubleObject, nil];
    
    NSLog(@"boolVar = %d intVar = %d uintVar = %d cgFloatVAr = %f doubleVar = %f",
          [[array objectAtIndex:0] boolValue],
          [[array objectAtIndex:1] intValue],
          [[array objectAtIndex:2] unsignedIntegerValue],
          [[array objectAtIndex:3] floatValue],
          [[array objectAtIndex:4] doubleValue]);
    
    CGPoint point1 = CGPointMake(0, 5);
    CGPoint point2 = CGPointMake(3, 4);
    CGPoint point3 = CGPointMake(2, 8);
    CGPoint point4 = CGPointMake(7, 1);
    CGPoint point5 = CGPointMake(4, 4);
    
    NSArray *array2 = [NSArray arrayWithObjects:
                      [NSValue valueWithCGPoint:point1],
                      [NSValue valueWithCGPoint:point2],
                      [NSValue valueWithCGPoint:point3],
                      [NSValue valueWithCGPoint:point4],
                      [NSValue valueWithCGPoint:point5], nil];
    
    for (NSValue *value in array2) {
        CGPoint point = [value CGPointValue];
        NSLog(@"point = %@", NSStringFromCGPoint(point));
    }
}

+ (void) testProtocols {
    NSLog(@"~~~~~~~~~~~~~~~~~~Protocols Tests~~~~~~~~~~~~~~~~~");
    
    YKDancer7 *dancer1 = [[YKDancer7 alloc] init];
    YKDancer7 *dancer2 = [[YKDancer7 alloc] init];
    YKDancer7 *dancer3 = [[YKDancer7 alloc] init];
    
    YKStudent7 *student1 = [[YKStudent7 alloc] init];
    YKStudent7 *student2 = [[YKStudent7 alloc] init];
    
    YKDeveloper7 *developer1 = [[YKDeveloper7 alloc] init];
    
    dancer1.name = @"Dancer1";
    dancer2.name = @"Dancer2";
    dancer3.name = @"Dancer3";
    student1.name = @"Student1";
    student2.name = @"Student2";
    developer1.name = @"Developer1";
    
    NSArray *patients = @[dancer1, dancer2, dancer3, student1, student2, developer1];
    
    for (id <YKPatient> patient in patients) {
        if ([patient conformsToProtocol:@protocol(YKPatient)]) {
            NSLog(@"Patient name: %@", patient.name);
            if ([patient respondsToSelector:@selector(howIsYourFamily)]) {
                NSLog(@"How is your family? \n - %@", [patient howIsYourFamily]);
            }
            
            if ([patient respondsToSelector:@selector(howIsYourJob)]) {
                NSLog(@"How is your job? \n - %@", [patient howIsYourJob]);
            }
            
            if (![patient areYouOK]) {
                [patient takePill];
                if (![patient areYouOK]) {
                    [patient makeShot];
                }
            }
        }
        
        else NSLog(@"FAKE!!!");
    }
}

@end

//
//  YK8HomeWork.m
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 14.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import "YK8HomeWork.h"
#import "YKStudent.h"

@implementation YK8HomeWork

+ (void) students {
    YKStudent *student1 = [[YKStudent alloc] init];
    YKStudent *student2 = [[YKStudent alloc] init];
    YKStudent *student3 = [[YKStudent alloc] init];
    YKStudent *student4 = [[YKStudent alloc] init];
    YKStudent *student5 = [[YKStudent alloc] init];
    
    student1.name = @"Alex";
    student1.lastName = @"Simpson";
    student1.speech = @"Hello, I am ";
    
    student2.name = @"Bob";
    student2.lastName = @"Harlson";
    student2.speech = @"Hello, I am ";
    
    student3.name = @"Clark";
    student3.lastName = @"Robbson";
    student3.speech = @"Hello, I am ";
    
    student4.name = @"George";
    student4.lastName = @"Johnson";
    student4.speech = @"Hello, I am ";
    
    student5.name = @"Dick";
    student5.lastName = @"Chaise";
    student5.speech = @"Hello, I am ";
    
    
    NSDictionary *schoolDiary = @{[student1 fullName] : student1,
                                  [student2 fullName] : student2,
                                  [student3 fullName] : student3,
                                  [student4 fullName] : student4,
                                  [student5 fullName] : student5};
    NSLog(@"%@", schoolDiary);
    
    NSDictionary *schoolDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                      student1, [student1 studentID],
                                      student2, [student2 studentID],
                                      student3, [student3 studentID],
                                      student4, [student4 studentID],
                                      student5, [student5 studentID], nil];
    NSLog(@"SchoolDictionary: \n %@ ", schoolDictionary); //сортированные ключи и дискрипшн, выведет по алфавиту!!!! без всяких сортировок
    
    for (YKStudent *key in [schoolDictionary allKeys]) {    //одинаково выводит только ключи не сортированные
        NSLog(@"allKeys %@ - ", key);
    }
    
    for (YKStudent *key in schoolDictionary) {  //одинаково выводит только ключи не сортированные
        NSLog(@"allKeys %@ - ", key);
    }
    
    for (YKStudent *value in [schoolDictionary allValues]) {
        NSLog(@"allValues %@ - ", value);
    }
    
    NSLog(@"~~~~~4 Student~~~~~");
    for (YKStudent *key in [schoolDictionary allKeys]) {
        NSLog(@"Object by Key:\n %@ %@ \n+ %@ - ", [[schoolDictionary objectForKey:key] name], [[schoolDictionary objectForKey:key] lastName], [schoolDictionary objectForKey:key]);
    }
    
    NSLog(@"~~~~~5 Master~~~~~");
    NSLog(@"Not Sorted schoolDictionary - %@", [schoolDictionary allKeys]);

    NSArray *keys = [schoolDictionary allKeys];
    NSLog(@"Not Sorted array - %@", keys);
    NSArray *sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare: obj2];
    }];
    
    NSLog(@"Sorted array - %@", sortedKeys);
    NSDictionary *sortedSchoolDictionary = [[NSDictionary alloc] init]; //сортировка ключей в Дикшнари ни к чему не приводит! при выводе с командой allkeys все перемешивается!!!!
    NSMutableDictionary *mutableSchoolDictionary = [[NSMutableDictionary alloc] init];
    NSLog(@"sortedSchoolDictionary By Sorted Keys From Sorted Array!");
    for (id key in sortedKeys) {
        NSDictionary *tempObj = [schoolDictionary objectForKey:key];
        NSLog(@"%@ - %@", key, tempObj); //поэтому нужно каждый раз через метод сортировки прогонять дикшнари чтобы вывести по алфавиту! или протосто NSLog(@"%@", myDictionary);!!!!
        mutableSchoolDictionary[key] = tempObj;
    }
    
    sortedSchoolDictionary = mutableSchoolDictionary;
    mutableSchoolDictionary = nil;
    NSLog(@"sortedSchoolDictionary: \n %@", sortedSchoolDictionary);
    
    NSLog(@"~~~~~6 Superman~~~~~");
    NSLog(@"schoolDiary: \n %@", schoolDiary);
    
    NSObject *object1 = [[NSObject alloc] init];
    NSObject *object2 = [[NSObject alloc] init];
    NSObject *object3 = [[NSObject alloc] init];
    NSObject *object4 = [[NSObject alloc] init];
    NSObject *object5 = [[NSObject alloc] init];
    NSArray *objects = @[object1, object2, object3, object4, object5];
    
    NSMutableDictionary *mutableSchoolDiary = [[NSMutableDictionary alloc] init];
    for (id key in schoolDiary) {
        NSLog(@"old key - %@", key);
        NSUInteger index = 4;
        NSObject *object = [objects objectAtIndex: index];
//        [mutableSchoolDiary setObject:[schoolDiary objectForKey:key] forKey:object];
        
        mutableSchoolDiary[@"Key"] = [schoolDiary objectForKey:key]; //не добавляется обьект как ключь!!!!!!!!!!!!!!!!!
        index--;
        NSLog(@"%@", mutableSchoolDiary);
    }
    
    NSLog(@"%@", mutableSchoolDiary);
}

//не доделан последнее что у скутара убрано. NSObject нельзя добавить как указатель на обьект в NSDictionaty т.к. сначало нужно раелизовать в нем метод копирования CopyWithZone.  или заменить NSObject на NSDate.
@end

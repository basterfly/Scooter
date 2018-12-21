//
//  YKBoxer.m
//  Scooter2018
//
//  Created by Egor Kozlovskiy on 26.02.2018.
//  Copyright © 2018 Yegor Kozlovskiy. All rights reserved.
//

#import "YKBoxer.h"

@interface YKBoxer () //ИНКАПСУЛЯЦИЯ создаем КАТЕГОРИЮ для расширения нашего класса на внутренне проперти
@property (assign, nonatomic) NSUInteger nameCount;
@end

@implementation YKBoxer
@synthesize name = _name; // это нужно если хотим переопределить и сеттер и геттер! если что то одно то не нужно

- (id) init {
    if (self) {
        self.nameCount = 0;
        self.name = @"Default";
        self.age = 1;
        self.height = 0.52;
        self.weight = 3.56;
    }
    return self;
}

- (void) setName:(NSString *)name { //переопределяем setName
    NSLog(@"boxer name is ???");
//    _name = name; //зацикливаем сетНЕЙМ УСТАНОВКОЙ в Ивар значение нейм из метода нейм. т.е. он все время запускает метод нейм по кругу
    _name = @"Petya"; // _name- inner variable of class iVar, установить значение можно через внутренню переменную класса
}

- (NSString *) name {
    self.nameCount = self.nameCount + 1;
    NSLog(@"Name getter is callet %lu times", (unsigned long)self.nameCount);

    return @"Vasia"; //_name
}

- (NSUInteger) age {
    NSLog(@"age getter is called");
    return _age;
}

- (NSUInteger) howOldAreYou {
    return self.age;
}

@end

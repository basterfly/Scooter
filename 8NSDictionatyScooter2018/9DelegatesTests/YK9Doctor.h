//
//  YK9Doctor.h
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YKPatientDelegate9; //ЧТОбы не копировать в публичный интерфейс импорт протокола из YK9Patient.h указываем просто что такой метод есть!

@interface YK9Doctor : NSObject <YKPatientDelegate9>

@end

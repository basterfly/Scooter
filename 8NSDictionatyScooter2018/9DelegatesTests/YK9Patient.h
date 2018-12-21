//
//  YK9Patient.h
//  8NSDictionatyScooter2018
//
//  Created by Egor Kozlovskiy on 17.08.2018.
//  Copyright © 2018 Egor Kozlovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YKPatientDelegate9; //т.к. протокл реализован ниже проперти с протоколом, то здесь указываем что он есть.

@interface YK9Patient : NSObject

@property (strong, nonatomic) NSString *name ;
@property (assign, nonatomic) CGFloat temperature;
//когда у какого либо обьекта есть делегат, то обязательно нужно сделать проперти для этого делегата!
//@property (weak, nonatomic) YK9Doctor <YKPatientDelegate9> *doctor; //обязательно указываем делегат отвечающий протоколу!
@property (weak, nonatomic) id <YKPatientDelegate9> delegate;// т.к. делегат может быть какой угодно обьект наследник NSObject <...> *, то ставим id обьект, и обычно проперти имеет название delegate.
- (BOOL) howAreYou;
- (void) takePill;
- (void) makeShot;

@end

@protocol YKPatientDelegate9 <NSObject>

- (void) patientFeelsBad:(YK9Patient *) patient;
- (void) patient:(YK9Patient *) patient hasQuestion:(NSString *) question;

@end

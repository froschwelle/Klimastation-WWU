//
//  Weatherdata.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 23.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weatherdata : NSObject

@property (nonatomic, strong) NSDateFormatter *inputFormatter;


@property (strong, nonatomic) NSDate *date;
@property (assign, nonatomic) double temperatur;
@property (assign, nonatomic) double maxTemperatur;
@property (assign, nonatomic) double minTemperatur;
@property (assign, nonatomic) double luftfeuchtigkeit;
@property (assign, nonatomic) double luftdruck;
@property (assign, nonatomic) double windgeschwindigkeit;
@property (assign, nonatomic) double windrichtung;
@property (assign, nonatomic) double sichtweite;
@property (assign, nonatomic) double maxwind;
@property (assign, nonatomic) double niederschlag;

+ (Weatherdata*)createWeatherdatafromArray:(NSArray*)array;


@end

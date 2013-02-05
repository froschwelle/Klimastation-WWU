//
//  Weatherdata.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 23.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "Weatherdata.h"

@implementation Weatherdata


+ (Weatherdata*)createWeatherdatafromArray:(NSArray*)array
{
    Weatherdata *data = [[Weatherdata alloc]init];
    
    data.inputFormatter = [[NSDateFormatter alloc] init];
    data.inputFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    data.date = [data.inputFormatter dateFromString:array[0]];
    
    data.temperatur = [array[1] doubleValue];
    data.maxTemperaturLabel = [array[2] doubleValue];
    data.minTemperaturLabel = [array[3] doubleValue];
    data.luftfeuchtigkeit = [array[4] doubleValue];
    data.luftdruck = [array[7] doubleValue];
    data.windgeschwindigkeit = [array[5] doubleValue];
    data.windrichtung = [array[6] doubleValue];
    data.sichtweite = [array[8] doubleValue];
    data.maxwind = [array[9] doubleValue];
    data.niederschlag = [array[10] doubleValue];
    
    return data;

}




@end

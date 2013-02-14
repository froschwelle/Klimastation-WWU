//
//  WSGraphViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 22.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
	GraphStyleTemperature,
	GraphStyleMaxTemperature,
	GraphStyleMinTemperature,
	GraphStyleHumidity,
	GraphStyleWindSpeed,
	GraphStyleMaxWindSpeed,
	GraphStyleVisibility,
	GraphStylePerceptionRain,
	GraphStyleAirPressure
} GraphStyle;


@protocol GraphDelegate <NSObject>
- (NSArray*)dataForGraphStyle:(GraphStyle)graphStyle;
@end


@class WSMonthlyWeatherData;

@interface WSGraphViewController : UIViewController 
@property (nonatomic, assign) NSInteger monthNumber;
@property (nonatomic, strong) NSString *graphTitle;

@property (nonatomic, assign) id <GraphDelegate> delegate;
- (IBAction)infoPressed:(id)sender;


@end

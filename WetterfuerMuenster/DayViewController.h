//
//  DayViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 23.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weatherdata.h"

@interface DayViewController : UITableViewController
@property (nonatomic, strong) Weatherdata *data;
- (IBAction)showGrafik:(id)sender;

@end

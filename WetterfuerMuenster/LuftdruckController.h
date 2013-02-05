//
//  LuftdruckController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 25.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuftdruckController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *web;
- (IBAction)fiveDays:(id)sender;
- (IBAction)twentyDays:(id)sender;

@end

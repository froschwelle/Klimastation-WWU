//
//  ViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 22.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) NSString *url1;
@property (nonatomic,strong) NSString *url2;



@property (strong, nonatomic) IBOutlet UIWebView *web;
- (IBAction)fiveDays:(id)sender;
- (IBAction)twentyDays:(id)sender;






@end

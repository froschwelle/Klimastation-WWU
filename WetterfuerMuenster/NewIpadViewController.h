//
//  NewIpadViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 25.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewIpadViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *web1;
@property (strong, nonatomic) IBOutlet UIWebView *web2;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
- (IBAction)temperatur:(id)sender;
- (IBAction)luftfeuchtigkeit:(id)sender;
- (IBAction)luftdruck:(id)sender;
- (IBAction)windgeschwindigkeit:(id)sender;
- (IBAction)refresh:(id)sender;

@end

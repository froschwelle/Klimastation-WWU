//
//  BottanischCamViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 30.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottanischCamViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *web;
- (IBAction)savePicture:(id)sender;
- (IBAction)refresh:(id)sender;

@end

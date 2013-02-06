//
//  AaseeCamViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 30.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AaseeCamViewController : UIViewController {
    NSTimer *timer;
}

@property (strong, nonatomic) IBOutlet UIWebView *web;

@property (nonatomic, strong) NSURL *werbungurl;
- (IBAction)savePicture:(id)sender;
- (IBAction)refresh:(id)sender;
- (IBAction)werbung1:(id)sender;
- (IBAction)werbung2:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *werbung;

@end

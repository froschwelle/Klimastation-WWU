//
//  IpadCamViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 28.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IpadCamViewController : UIViewController

@property (nonatomic, strong) NSURL *camurl;
@property (nonatomic, strong) NSURL *werbungurl;
@property (strong, nonatomic) IBOutlet UIWebView *web;
- (IBAction)aaseePanoramaWebcam:(id)sender;
- (IBAction)klimaCam:(id)sender;
- (IBAction)refresh:(id)sender;
- (IBAction)bottCam:(id)sender;
- (IBAction)savePicture:(id)sender;
- (IBAction)werbungPressed:(id)sender;
- (IBAction)werbung2Pressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *werbung;

@end

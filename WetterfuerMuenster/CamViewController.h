//
//  CamViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 28.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CamViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *web;
@property (nonatomic, strong) NSURL *camurl;
- (IBAction)refresh:(id)sender;
- (IBAction)aaseeCam:(id)sender;
- (IBAction)klimaCam:(id)sender;

@end

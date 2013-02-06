//
//  LiveViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 26.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveViewController : UIViewController //<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *tempLabel;
@property (strong, nonatomic) IBOutlet UILabel *codeLabel;
@property (strong, nonatomic) IBOutlet UILabel *codeLabel1;
@property (strong, nonatomic) IBOutlet UILabel *codeLabel2;
- (IBAction)refresh:(id)sender;

@end

//
//  IpadDataViewController.h
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 25.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IpadDataViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *tempLabel;
- (IBAction)refresh:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *codeLabel;
@property (strong, nonatomic) IBOutlet UILabel *codeLabel1;
@property (strong, nonatomic) IBOutlet UILabel *codeLabel2;
- (BOOL) isConnected;

@end

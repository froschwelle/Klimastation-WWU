//
//  CreditsViewController.h
//  WetterfuerMuenster
//
//  Created by Florian Seichter on 04.02.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditsViewController : UIViewController
- (IBAction)closeView:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

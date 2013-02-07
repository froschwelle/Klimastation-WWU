//
//  CreditsViewController.m
//  WetterfuerMuenster
//
//  Created by Florian Seichter on 04.02.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "CreditsViewController.h"

@interface CreditsViewController ()

@end

@implementation CreditsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView.backgroundColor = [UIColor clearColor];
    //self.textView.text = @"hallo!";
    self.version.text = @"Version 0.8 Beta 1!";
    
    
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

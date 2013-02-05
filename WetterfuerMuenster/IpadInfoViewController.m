//
//  IpadInfoViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 25.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "IpadInfoViewController.h"

@interface IpadInfoViewController ()

@end

@implementation IpadInfoViewController

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
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:
                                 [UIImage imageNamed:@"TableViewBackground@2x"]];
    
    self.textView.backgroundColor = [UIColor clearColor];
    
    self.textView.text = @"Bitte wählen sie beim Start der App aus, welche Art von Grafik sie sehen möchten. Dannach wird die App automatisch die aktuellsten Grafiken laden, soweit sie eine funktionierende Internetverbindung haben. Später können sie entweder die Grafik aktualisiern oder eine andere laden.";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

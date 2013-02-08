//
//  LuftfeuchtigkeitController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 25.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "LuftfeuchtigkeitController.h"

@interface LuftfeuchtigkeitController ()

@end

@implementation LuftfeuchtigkeitController

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
                                 [UIImage imageNamed:@"TableViewBackground"]];
    NSURL *url1 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0004wdhg_05_de.gif"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url1];
    
    [self.web loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fiveDays:(id)sender {
    //[self.activity startAnimating];
    //self.activity.hidden = NO;
    
    NSURL *url1 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0004wdhg_05_de.gif"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url1];

    [self.web loadRequest:request];
    
    //[self.activity stopAnimating];
    //self.activity.hidden = YES;
}

- (IBAction)twentyDays:(id)sender {
    //[self.activity startAnimating];
    //self.activity.hidden = NO;
    
    NSURL *url2 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0004wdhg_20_de.gif"];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
    
    [self.web loadRequest:request2];
    
    //[self.activity stopAnimating];
    //self.activity.hidden = YES;
}
@end

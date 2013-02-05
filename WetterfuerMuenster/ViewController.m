//
//  ViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 22.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //UIImage *background = [UIImage imageNamed:@"TableViewBackground.png"];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:
                                 [UIImage imageNamed:@"TableViewBackground"]];
    
    self.url1 = @"http://www.uni-muenster.de/Klima/data/pics/0001tdhg_05_de.gif";
    
    NSString *stringurl = self.url1;
    NSURL *url = [NSURL URLWithString:stringurl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.web loadRequest:request];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)fiveDays:(id)sender
{
    //[self.activity startAnimating];
    //self.activity.hidden = NO;
    
    self.url1 = @"http://www.uni-muenster.de/Klima/data/pics/0001tdhg_05_de.gif";

    NSString *stringurl = self.url1;
    NSURL *url = [NSURL URLWithString:stringurl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.web loadRequest:request];
    
    //[self.activity stopAnimating];
    //self.activity.hidden = YES;
}

- (IBAction)twentyDays:(id)sender
{
    //[self.activity startAnimating];
    //self.activity.hidden = NO;
    
    self.url2 = @"http://www.uni-muenster.de/Klima/data/pics/0001tdhg_20_de.gif";

    NSString *stringurl2 = self.url2;
    NSURL *url2 = [NSURL URLWithString:stringurl2];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
    [self.web loadRequest:request2];
    
    //[self.activity stopAnimating];
    //self.activity.hidden = YES;
}


@end

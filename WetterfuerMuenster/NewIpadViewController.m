//
//  NewIpadViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 25.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "NewIpadViewController.h"

@interface NewIpadViewController ()

@property (nonatomic, strong) NSURL * url1;
@property (nonatomic, strong) NSURL * url2;

@end

@implementation NewIpadViewController

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
    UIImage *toolbarBackground = [UIImage imageNamed:@"UINavigationBar"];
    [self.navigationController.navigationBar setBackgroundImage:toolbarBackground forBarMetrics:UIBarMetricsDefault];
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:
                                 [UIImage imageNamed:@"TableViewBackground@2x"]];
    
    self.url1 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0001tdhg_05_de.gif"];
    self.url2 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0001tdhg_20_de.gif"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url1];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:self.url2];
    
    [self.web1 loadRequest:request];
    [self.web2 loadRequest:request2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)temperatur:(id)sender {
    self.label1.text = @"";
    self.label2.text = @"";
    
    self.url1 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0001tdhg_05_de.gif"];
    self.url2 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0001tdhg_20_de.gif"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url1];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:self.url2];
    
    [self.web1 loadRequest:request];
    [self.web2 loadRequest:request2];
}

- (IBAction)luftfeuchtigkeit:(id)sender {
    self.label1.text = @"";
    self.label2.text = @"";
    
    self.url1 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0002rhhg_05_de.gif"];
    self.url2 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0002rhhg_20_de.gif"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url1];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:self.url2];
    
    [self.web1 loadRequest:request];
    [self.web2 loadRequest:request2];
}

- (IBAction)luftdruck:(id)sender {
    self.label1.text = @"";
    self.label2.text = @"";
    
    self.url1 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0005aphg_05_de.gif"];
    self.url2 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0005aphg_20_de.gif"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url1];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:self.url2];
    
    [self.web1 loadRequest:request];
    [self.web2 loadRequest:request2];
}

- (IBAction)windgeschwindigkeit:(id)sender {
    self.label1.text = @"Rot = 10-min-Mittel  Gelb = 10-min-Maximum";
    self.label2.text = @"Rot = 10-min-Mittel  Gelb = 10-min-Maximum";
    
    self.url1 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0003wshg_05_de.gif"];
    self.url2 = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/data/pics/0003wshg_20_de.gif"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url1];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:self.url2];
    
    [self.web1 loadRequest:request];
    [self.web2 loadRequest:request2];
}

- (IBAction)refresh:(id)sender {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url1];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:self.url2];
    
    [self.web1 loadRequest:request];
    [self.web2 loadRequest:request2];
}

@end

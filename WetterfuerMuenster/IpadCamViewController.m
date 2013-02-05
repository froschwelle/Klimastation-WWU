//
//  IpadCamViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 28.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "IpadCamViewController.h"

@interface IpadCamViewController ()

@end

@implementation IpadCamViewController

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
    
    UIImage *toolbarBackground = [UIImage imageNamed:@"UINavigationBar"];
    [self.navigationController.navigationBar setBackgroundImage:toolbarBackground forBarMetrics:UIBarMetricsDefault];
    
    _camurl = [NSURL URLWithString:@"http://klimacam.uni-muenster.de/record/current.jpg?rand=926855"];
    NSURLRequest *request = [NSURLRequest requestWithURL:_camurl];
    
    [self.web loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aaseePanoramaWebcam:(id)sender {
    _camurl = [NSURL URLWithString:@"http://overschmidt.mega-edv.de/current.jpg?foo=1359392118189"];
    NSURLRequest *request = [NSURLRequest requestWithURL:_camurl];
    [self.web loadRequest:request];
}

- (IBAction)klimaCam:(id)sender {
    
    _camurl = [NSURL URLWithString:@"http://klimacam.uni-muenster.de/record/current.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:_camurl];
    [self.web loadRequest:request];
}

- (IBAction)refresh:(id)sender {
    NSURLRequest *request = [NSURLRequest requestWithURL:_camurl];
    
    [self.web loadRequest:request];
}
@end

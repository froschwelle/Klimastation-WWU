//
//  SelectController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 26.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "SelectController.h"

@interface SelectController ()

@end

@implementation SelectController

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
                                 [UIImage imageNamed:@"TableViewBackground"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end

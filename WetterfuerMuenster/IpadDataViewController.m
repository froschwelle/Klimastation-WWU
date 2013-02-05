//
//  IpadDataViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 25.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "IpadDataViewController.h"
#import "CreditsViewController.h"

@interface IpadDataViewController ()

@end

@implementation IpadDataViewController

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
	if (IS_FIRST_START) {
		UIAlertView *verbindung = [[UIAlertView alloc]initWithTitle:@"Verbindung" message:@"Für diese App benötigen sie eine gute Internetverbindung. Bei längeren Wartezeiten sollten sie die Verbindung prüfen." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[verbindung show];
		SET_FIRST_START_IS_OVER;
	}
	// Do any additional setup after loading the view.
	
    self.tempLabel.text = @"";
    NSArray *quelltext;
    NSString *tempInQuelltext;
    NSString *temp;
    
    
    
   
    
    
    
        
    NSURL *url = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/wetter/wetter.php"];
    NSString *content = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    if (content.length == 188){
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Verbindungsfehler" message:@"Es konnte keine Verbindung zum Server hergestellt werden oder der Server ist mommentan nicht erreichbar!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [error show];
        self.tempLabel.text = @"Fehler";
    }
    else
    {
        quelltext = [content componentsSeparatedByString:@"\n"];
        NSLog(@"%@",quelltext[203]);
        tempInQuelltext = quelltext[203];
        temp = [tempInQuelltext substringWithRange:NSMakeRange(54, 6)];
        NSLog(@"%@",temp);
        self.tempLabel.text = temp;
    }

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refresh:(id)sender {
    NSArray *quelltext;
    NSString *tempInQuelltext;
    NSString *temp;
    
    NSURL *url = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/wetter/wetter.php"];
    NSString *content = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    if (content.length == 188){
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Verbindungsfehler" message:@"Es konnte keine Verbindung zum Server hergestellt werden oder der Server ist mommentan nicht erreichbar!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [error show];
        self.tempLabel.text = @"Fehler";
    }
    else
    {
        quelltext = [content componentsSeparatedByString:@"\n"];
        NSLog(@"%@",quelltext[203]);
        tempInQuelltext = quelltext[203];
        temp = [tempInQuelltext substringWithRange:NSMakeRange(54, 6)];
        NSLog(@"%@",temp);
        self.tempLabel.text = temp;
    }
}
@end

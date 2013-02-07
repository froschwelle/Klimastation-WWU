//
//  LiveViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 26.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "LiveViewController.h"

@interface LiveViewController ()

@end

@implementation LiveViewController

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
	if (IS_FIRST_START)
	{
		UIAlertView *verbindung = [[UIAlertView alloc]initWithTitle:@"Verbindung" message:@"Für diese App benötigen sie eine gute Internetverbindung. Bei längeren Wartezeiten sollten sie die Verbindung prüfen." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
		[verbindung show];
		
		SET_FIRST_START_IS_OVER;
	}
	// Do any additional setup after loading the view.
	self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:
                                 [UIImage imageNamed:@"TableViewBackground"]];
	
    NSArray *quelltext;
    NSString *tempInQuelltext;
    NSString *temp;
    
    NSString *wetterCodeinQuelltext;
    NSString *wetterCode;
    NSData *dt = [wetterCode dataUsingEncoding:NSWindowsCP1251StringEncoding];
    NSString *str = [[NSString alloc] initWithData:dt encoding:NSUTF8StringEncoding];
    
    
    NSString *wetterCodeInQuelltext1;
    NSString *wetterCode1;
    
    NSString *wetterCodeInQuelltext2;
    NSString *wetterCode2;
    
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/wetter/wetter.php"];
    NSString *content = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    
    if (content.length == 188)
    {
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Verbindungsfehler" message:@"Es konnte keine Verbindung zum Server hergestellt werden oder der Server ist mommentan nicht erreichbar!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [error show];
    }
    else
    {
        
                
        
                
        
        quelltext = [content componentsSeparatedByString:@"\n"];
        tempInQuelltext = quelltext[203];
        temp = [tempInQuelltext substringWithRange:NSMakeRange(54, 6)];
        self.tempLabel.text = temp;
        
        
        
        wetterCodeinQuelltext = quelltext[254];
        int length = [wetterCodeinQuelltext rangeOfString:@"</td>"].location - 54;
        wetterCode = [wetterCodeinQuelltext substringWithRange:NSMakeRange(54, length)];
        //NSLog(@"%s", wetterCode.UTF8String);
        //wetterCode
        self.codeLabel.text = [wetterCode capitalizedString];
        
        
        
        wetterCodeInQuelltext1 = quelltext[248];
        int *length1 = [wetterCodeInQuelltext1 rangeOfString:@"</td>"].location -23;
        //NSLog(@"%i", [wetterCodeInQuelltext1 rangeOfString:@"\"tab3\">"].location);
        wetterCode1 = [wetterCodeInQuelltext1 substringWithRange:NSMakeRange(23, length1)];
        
        
        wetterCodeInQuelltext2 = quelltext[249];
        int *length2 = [wetterCodeInQuelltext2 rangeOfString:@"</td>"].location -54;
        //NSLog(@"%i", [wetterCodeInQuelltext2 rangeOfString:@"\">"].location);
        wetterCode2 = [wetterCodeInQuelltext2 substringWithRange:NSMakeRange(54, length2)];
        self.codeLabel1.text = [NSString stringWithFormat:@"%@ - %@", wetterCode1, wetterCode2];
        if ([self.codeLabel1.text  isEqualToString:@"(null) - (null)"]) {
            self.codeLabel1.text = [NSString stringWithFormat:@"Fehler"];
        }
        
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refresh:(id)sender {
    /*NSArray *quelltext;
    NSString *tempInQuelltext;
    NSString *temp;*/
    
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.uni-muenster.de/Klima/wetter/wetter.php"];
    NSString *content = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    //NSLog(@"%@",content);
    if (content.length == 188){
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Verbindungsfehler" message:@"Es konnte keine Verbindung zum Server hergestellt werden oder der Server ist mommentan nicht erreichbar!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [error show];
    }
    else
    {
        /*
        quelltext = [content componentsSeparatedByString:@"\n"];
        tempInQuelltext = quelltext[203];
        temp = [tempInQuelltext substringWithRange:NSMakeRange(54, 6)];
        self.tempLabel.text = temp;
         
         */
        
        
        
        [self viewDidLoad];
    }
    
}

@end

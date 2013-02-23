//
//  LiveViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 26.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "LiveViewController.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"


@interface LiveViewController ()

@end

@implementation LiveViewController
- (NSString *)decodeHTMLEntities:(NSString *)string {
	// Reserved Characters in HTML
	string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
	string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
	string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
	string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
	string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
	
	// ISO 8859-1 Symbols
	string = [string stringByReplacingOccurrencesOfString:@"&iexcl;" withString:@"¡"];
	string = [string stringByReplacingOccurrencesOfString:@"&cent;" withString:@"¢"];
	string = [string stringByReplacingOccurrencesOfString:@"&pound;" withString:@"£"];
	string = [string stringByReplacingOccurrencesOfString:@"&curren;" withString:@"¤"];
	string = [string stringByReplacingOccurrencesOfString:@"&yen;" withString:@"¥"];
	string = [string stringByReplacingOccurrencesOfString:@"&brvbar;" withString:@"¦"];
	string = [string stringByReplacingOccurrencesOfString:@"&sect;" withString:@"§"];
	string = [string stringByReplacingOccurrencesOfString:@"&uml;" withString:@"¨"];
	string = [string stringByReplacingOccurrencesOfString:@"&copy;" withString:@"©"];
	string = [string stringByReplacingOccurrencesOfString:@"&ordf;" withString:@"ª"];
	string = [string stringByReplacingOccurrencesOfString:@"&laquo;" withString:@"«"];
	string = [string stringByReplacingOccurrencesOfString:@"&not;" withString:@"¬"];
	string = [string stringByReplacingOccurrencesOfString:@"&shy;" withString:@"	"];
	string = [string stringByReplacingOccurrencesOfString:@"&reg;" withString:@"®"];
	string = [string stringByReplacingOccurrencesOfString:@"&macr;" withString:@"¯"];
	string = [string stringByReplacingOccurrencesOfString:@"&deg;" withString:@"°"];
	string = [string stringByReplacingOccurrencesOfString:@"&plusmn;" withString:@"±	"];
	string = [string stringByReplacingOccurrencesOfString:@"&sup2;" withString:@"²"];
	string = [string stringByReplacingOccurrencesOfString:@"&sup3;" withString:@"³"];
	string = [string stringByReplacingOccurrencesOfString:@"&acute;" withString:@"´"];
	string = [string stringByReplacingOccurrencesOfString:@"&micro;" withString:@"µ"];
	string = [string stringByReplacingOccurrencesOfString:@"&para;" withString:@"¶"];
	string = [string stringByReplacingOccurrencesOfString:@"&middot;" withString:@"·"];
	string = [string stringByReplacingOccurrencesOfString:@"&cedil;" withString:@"¸"];
	string = [string stringByReplacingOccurrencesOfString:@"&sup1;" withString:@"¹"];
	string = [string stringByReplacingOccurrencesOfString:@"&ordm;" withString:@"º"];
	string = [string stringByReplacingOccurrencesOfString:@"&raquo;" withString:@"»"];
	string = [string stringByReplacingOccurrencesOfString:@"&frac14;" withString:@"¼"];
	string = [string stringByReplacingOccurrencesOfString:@"&frac12;" withString:@"½"];
	string = [string stringByReplacingOccurrencesOfString:@"&frac34;" withString:@"¾"];
	string = [string stringByReplacingOccurrencesOfString:@"&iquest;" withString:@"¿"];
	string = [string stringByReplacingOccurrencesOfString:@"&times;" withString:@"×"];
	string = [string stringByReplacingOccurrencesOfString:@"&divide;" withString:@"÷"];
	
	// ISO 8859-1 Characters
	string = [string stringByReplacingOccurrencesOfString:@"&Agrave;" withString:@"À"];
	string = [string stringByReplacingOccurrencesOfString:@"&Aacute;" withString:@"Á"];
	string = [string stringByReplacingOccurrencesOfString:@"&Acirc;" withString:@"Â"];
	string = [string stringByReplacingOccurrencesOfString:@"&Atilde;" withString:@"Ã"];
	string = [string stringByReplacingOccurrencesOfString:@"&Auml;" withString:@"Ä"];
	string = [string stringByReplacingOccurrencesOfString:@"&Aring;" withString:@"Å"];
	string = [string stringByReplacingOccurrencesOfString:@"&AElig;" withString:@"Æ"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ccedil;" withString:@"Ç"];
	string = [string stringByReplacingOccurrencesOfString:@"&Egrave;" withString:@"È"];
	string = [string stringByReplacingOccurrencesOfString:@"&Eacute;" withString:@"É"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ecirc;" withString:@"Ê"];
	string = [string stringByReplacingOccurrencesOfString:@"&Euml;" withString:@"Ë"];
	string = [string stringByReplacingOccurrencesOfString:@"&Igrave;" withString:@"Ì"];
	string = [string stringByReplacingOccurrencesOfString:@"&Iacute;" withString:@"Í"];
	string = [string stringByReplacingOccurrencesOfString:@"&Icirc;" withString:@"Î"];
	string = [string stringByReplacingOccurrencesOfString:@"&Iuml;" withString:@"Ï"];
	string = [string stringByReplacingOccurrencesOfString:@"&ETH;" withString:@"Ð"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ntilde;" withString:@"Ñ"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ograve;" withString:@"Ò"];
	string = [string stringByReplacingOccurrencesOfString:@"&Oacute;" withString:@"Ó"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ocirc;" withString:@"Ô"];
	string = [string stringByReplacingOccurrencesOfString:@"&Otilde;" withString:@"Õ"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ouml;" withString:@"Ö"];
	string = [string stringByReplacingOccurrencesOfString:@"&Oslash;" withString:@"Ø"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ugrave;" withString:@"Ù"];
	string = [string stringByReplacingOccurrencesOfString:@"&Uacute;" withString:@"Ú"];
	string = [string stringByReplacingOccurrencesOfString:@"&Ucirc;" withString:@"Û"];
	string = [string stringByReplacingOccurrencesOfString:@"&Uuml;" withString:@"Ü"];
	string = [string stringByReplacingOccurrencesOfString:@"&Yacute;" withString:@"Ý"];
	string = [string stringByReplacingOccurrencesOfString:@"&THORN;" withString:@"Þ"];
	string = [string stringByReplacingOccurrencesOfString:@"&szlig;" withString:@"ß"];
	string = [string stringByReplacingOccurrencesOfString:@"&agrave;" withString:@"à"];
	string = [string stringByReplacingOccurrencesOfString:@"&aacute;" withString:@"á"];
	string = [string stringByReplacingOccurrencesOfString:@"&acirc;" withString:@"â"];
	string = [string stringByReplacingOccurrencesOfString:@"&atilde;" withString:@"ã"];
	string = [string stringByReplacingOccurrencesOfString:@"&auml;" withString:@"ä"];
	string = [string stringByReplacingOccurrencesOfString:@"&aring;" withString:@"å"];
	string = [string stringByReplacingOccurrencesOfString:@"&aelig;" withString:@"æ"];
	string = [string stringByReplacingOccurrencesOfString:@"&ccedil;" withString:@"ç"];
	string = [string stringByReplacingOccurrencesOfString:@"&egrave;" withString:@"è"];
	string = [string stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"];
	string = [string stringByReplacingOccurrencesOfString:@"&ecirc;" withString:@"ê"];
	string = [string stringByReplacingOccurrencesOfString:@"&euml;" withString:@"ë"];
	string = [string stringByReplacingOccurrencesOfString:@"&igrave;" withString:@"ì"];
	string = [string stringByReplacingOccurrencesOfString:@"&iacute;" withString:@"í"];
	string = [string stringByReplacingOccurrencesOfString:@"&icirc;" withString:@"î"];
	string = [string stringByReplacingOccurrencesOfString:@"&iuml;" withString:@"ï"];
	string = [string stringByReplacingOccurrencesOfString:@"&eth;" withString:@"ð"];
	string = [string stringByReplacingOccurrencesOfString:@"&ntilde;" withString:@"ñ"];
	string = [string stringByReplacingOccurrencesOfString:@"&ograve;" withString:@"ò"];
	string = [string stringByReplacingOccurrencesOfString:@"&oacute;" withString:@"ó"];
	string = [string stringByReplacingOccurrencesOfString:@"&ocirc;" withString:@"ô"];
	string = [string stringByReplacingOccurrencesOfString:@"&otilde;" withString:@"õ"];
	string = [string stringByReplacingOccurrencesOfString:@"&ouml;" withString:@"ö"];
	string = [string stringByReplacingOccurrencesOfString:@"&oslash;" withString:@"ø"];
	string = [string stringByReplacingOccurrencesOfString:@"&ugrave;" withString:@"ù"];
	string = [string stringByReplacingOccurrencesOfString:@"&uacute;" withString:@"ú"];
	string = [string stringByReplacingOccurrencesOfString:@"&ucirc;" withString:@"û"];
	string = [string stringByReplacingOccurrencesOfString:@"&uuml;" withString:@"ü"];
	string = [string stringByReplacingOccurrencesOfString:@"&yacute;" withString:@"ý"];
	string = [string stringByReplacingOccurrencesOfString:@"&thorn;" withString:@"þ"];
	string = [string stringByReplacingOccurrencesOfString:@"&yuml;" withString:@"ÿ"];
	
	return string;
}

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
        //wetterCode = stringByReplacingPercentEscapesUsingEncoding:(NSStringEncoding)encoding;
        //wetterCode = @"M&uuml;nster"; //testing HTML decoding
        wetterCode = [self decodeHTMLEntities:wetterCode];
        
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

- (void)viewDidUnload {
    [self setLastReload:nil];
    [super viewDidUnload];
}
@end

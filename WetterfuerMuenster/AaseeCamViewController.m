//
//  AaseeCamViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 30.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "AaseeCamViewController.h"

@interface AaseeCamViewController ()
@property (nonatomic, strong) NSURL *camurl;
@end

@implementation AaseeCamViewController

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
    self.camurl = [NSURL URLWithString:@"http://overschmidt.mega-edv.de/current.jpg?foo=1359546148048"];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.camurl];
	//http://klimacam.uni-muenster.de/record/current.jpg?rand=926855
    [self.web loadRequest:request];
    
    
    self.werbungurl = [NSURL URLWithString:@"http://www.overschmidt.de/var/ezwebin_site/storage/images/media/images/webcam-content-images/webcam-image-2012/39601-1-ger-DE/Webcam-Image-2012.gif"];
    NSURLRequest *request1 = [NSURLRequest requestWithURL:self.werbungurl];
	//http://klimacam.uni-muenster.de/record/current.jpg?rand=926855
    [self.werbung loadRequest:request1];
    
    
    
	[NSTimer scheduledTimerWithTimeInterval:5 target: self selector: @selector(refresh:) userInfo: nil repeats: YES];
}


- (IBAction)refresh:(id)sender {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.camurl];
    
    [self.web loadRequest:request];
    
}

- (IBAction)werbung1:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.overschmidt.de/Ausbildung/Kids-Jugendliche/Sportbootkurs-14-18-J."]];
}

- (IBAction)werbung2:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.aaseeschifffahrt.de"]];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)savePicture:(id)sender {
	CGSize layerSize = self.web.bounds.size;
	if ([UIScreen instancesRespondToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2.0f) {
		UIGraphicsBeginImageContextWithOptions(layerSize, NO, 2.0f);
	} else {
		UIGraphicsBeginImageContext(layerSize);
	}	[self.web.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	UIImageWriteToSavedPhotosAlbum(viewImage,nil,NULL,NULL);
	
	UIAlertView *save = [[UIAlertView alloc]initWithTitle:@"Gespeichert" message:@"Das ausgewählte Bild wurde erfolgreich in ihre Galerie gespeichert. Falls sie nicht das gesammte Bild in ihrer Galerie sehen können, müssen sie erst den Bereich, den sie später sehen wollen, reinziehen, sodass sie ihn selbst auf dem Bildschirm sehen können." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
	[save show];
}
@end

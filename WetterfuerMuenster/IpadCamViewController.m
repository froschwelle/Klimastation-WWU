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
    UIImage *toolbarBackground = [UIImage imageNamed:@"UINavigationBar"];
    [self.navigationController.navigationBar setBackgroundImage:toolbarBackground forBarMetrics:UIBarMetricsDefault];
	self.werbung.backgroundColor = [UIColor clearColor];
	self.werbung.hidden = YES;
    
    self.camurl = [NSURL URLWithString:@"http://klimacam.uni-muenster.de/record/current.jpg?rand=926855"];
    NSURLRequest *request = [NSURLRequest requestWithURL:_camurl];
    
    [self.web loadRequest:request];
	
	[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aaseePanoramaWebcam:(id)sender {
    self.camurl = [NSURL URLWithString:@"http://overschmidt.mega-edv.de/current.jpg"];
	self.werbungurl = [NSURL URLWithString:@"http://www.overschmidt.de/var/ezwebin_site/storage/images/media/images/webcam-content-images/webcam-image-2012/39601-1-ger-DE/Webcam-Image-2012.gif"];
	
    NSURLRequest *request = [NSURLRequest requestWithURL:self.camurl];
	NSURLRequest *werbungrequest = [NSURLRequest requestWithURL:self.werbungurl];
	
    [self.web loadRequest:request];
	self.werbung.hidden = NO;
	[self.werbung loadRequest:werbungrequest];
}

- (IBAction)klimaCam:(id)sender {
    self.werbung.hidden = YES;
    self.camurl = [NSURL URLWithString:@"http://klimacam.uni-muenster.de/record/current.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:_camurl];
    [self.web loadRequest:request];
}

- (IBAction)refresh:(id)sender {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.camurl];
    
    [self.web loadRequest:request];
}

- (IBAction)bottCam:(id)sender {
	self.werbung.hidden = YES;
    self.camurl = [NSURL URLWithString:@"http://garten.uni-muenster.de/Webcam/image.jsp"];
    NSURLRequest *request = [NSURLRequest requestWithURL:_camurl];
    [self.web loadRequest:request];
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
	
	UIAlertView *save = [[UIAlertView alloc]initWithTitle:@"Gespeichert" message:@"Das ausgewählte Bild wurde erfolgreich in ihre Galerie gespeichert." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
	[save show];
}

- (IBAction)werbungPressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.overschmidt.de/Ausbildung/Kids-Jugendliche/Sportbootkurs-14-18-J."]];

}

- (IBAction)werbung2Pressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.aaseeschifffahrt.de"]];
}

@end

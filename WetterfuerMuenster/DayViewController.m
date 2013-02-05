//
//  DayViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 23.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "DayViewController.h"

@interface DayViewController ()
@property (strong, nonatomic) IBOutlet UILabel *temperaturLabel;
@property (strong, nonatomic) IBOutlet UILabel *maxTemperaturLabel;
@property (strong, nonatomic) IBOutlet UILabel *minTemperaturLabel;
@property (strong, nonatomic) IBOutlet UILabel *luftfeuchtigkeit;
@property (strong, nonatomic) IBOutlet UILabel *luftdruck;
@property (strong, nonatomic) IBOutlet UILabel *windgeschwindigkeit;
@property (strong, nonatomic) IBOutlet UILabel *windrichtung;
@property (strong, nonatomic) IBOutlet UILabel *sichtweite;
@property (strong, nonatomic) IBOutlet UILabel *maxwind;
@property (strong, nonatomic) IBOutlet UILabel *niederschlag;



@end

@implementation DayViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    
    
	UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TableViewBackground"]];
	backgroundImageView.frame = self.tableView.bounds;
	self.tableView.backgroundView = backgroundImageView;
	
	
    self.temperaturLabel.text = [NSString stringWithFormat:@"%1.1f °C",self.data.temperatur];
    self.maxTemperaturLabel.text = [NSString stringWithFormat:@"%1.1f °C",self.data.maxTemperatur];
    self.minTemperaturLabel.text = [NSString stringWithFormat:@"%1.1f °C",self.data.minTemperatur];
    self.luftfeuchtigkeit.text = [NSString stringWithFormat:@"%1.1f %%",self.data.luftfeuchtigkeit];
    self.luftdruck.text = [NSString stringWithFormat:@"%1.0f hPa",self.data.luftdruck];
    self.windgeschwindigkeit.text = [NSString stringWithFormat:@"%1.2f m/s",self.data.windgeschwindigkeit];
    self.windrichtung.text = [NSString stringWithFormat:@"%1.0f °",self.data.windrichtung];
    self.sichtweite.text = [NSString stringWithFormat:@"%1.0f m",self.data.sichtweite];
    self.maxwind.text = [NSString stringWithFormat:@"%1.1f m/s",self.data.maxwind];
    self.niederschlag.text = [NSString stringWithFormat:@"%1.2f l/m²",self.data.niederschlag];
    
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    outputFormatter.dateFormat = @"EEEE, dd";
    
    self.title = [outputFormatter stringFromDate:self.data.date];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
}

- (IBAction)showGrafik:(id)sender
{
    
}
@end

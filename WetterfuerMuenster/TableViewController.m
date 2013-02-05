//
//  TableViewController.m
//  WetterfuerMuenster
//
//  Created by Tom Cinbis on 23.01.13.
//  Copyright (c) 2013 Tom Cinbis. All rights reserved.
//

#import "TableViewController.h"
#import "DayViewController.h"
#import "Weatherdata.h"
#import "WSGraphViewController.h"

@interface TableViewController () <GraphDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSDateFormatter *inputFormatter;
@property (nonatomic, strong) NSDateFormatter *outputFormatter;



@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TableViewBackground"]];
	backgroundImageView.frame = self.tableView.bounds;
	self.tableView.backgroundView = backgroundImageView;
    
    NSArray *monthNames = [[[NSDateFormatter alloc] init] monthSymbols];
    //monthNames = [NSString stringWithFormat:@"%i",self.monatAlsZahl];
    self.title = [NSString stringWithFormat:@"%@ %i", monthNames[self.monatAlsZahl -1], self.year];
    
    self.inputFormatter = [[NSDateFormatter alloc] init];
    self.inputFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    self.outputFormatter = [[NSDateFormatter alloc] init];
    self.outputFormatter.dateFormat = @"EEEE, dd. MMMM ";

    
    
    self.data = [NSMutableArray array];
    
    NSArray *dataArray;
    NSArray *dataYear;
    
    
		NSString *filePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"data%d_komprimiert", self.year] ofType:@"csv"]; // Holt den Pfad zur Datei
		
		NSError *error;
		NSString *dataYearString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error]; // Liest die Daten aus der Datei aus und speichert sie in die Variable dataYearString
		
		if (error) // Falls es einen Fehler gibt, zeige die Fehlermeldung in der Konsole an
		{
			NSLog(@"%@", error.localizedDescription);
		}
		
		dataYear = [dataYearString componentsSeparatedByString:@"\n"]; // Teilt den String in ein Array, in dem in jedem Eintrag eine Zeile der Daten steht
        
		for (NSString *dataDayString in dataYear) // Schleife über alle Einträge in dem Array
		{
            if(dataDayString.length == 0)
            {
                continue;
            }
            
			dataArray = [dataDayString componentsSeparatedByString:@";"]; // Teilt den aktuellen Eintrag in ein Array, welches die einzelnen Werte für den Tag enthält
        
            
            NSString *dateString = dataArray[0];
            
            if (self.year == [[dateString substringWithRange:NSMakeRange(0, 4)] intValue] && self.monatAlsZahl == [[dateString substringWithRange:NSMakeRange(5, 2)] intValue])
            {
                [self.data addObject:[Weatherdata createWeatherdatafromArray:dataArray]];

                continue;
            }
            
            
	
        
        
        }
   /* if (self.month = @"Januar")
        {
            self.monatAlsZahl = 1;
        }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell1";
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    Weatherdata *weatherData = self.data[indexPath.row];
    
    cell1.textLabel.text = [self.outputFormatter stringFromDate:weatherData.date];
    return cell1;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDay"])
    {
		int row = self.tableView.indexPathForSelectedRow.row;
		
        ((DayViewController*)segue.destinationViewController).data = self.data[row];
        
    } else if ([segue.identifier isEqualToString:@"showGraph"])
    {
        WSGraphViewController *graphViewController = (WSGraphViewController*)[(UINavigationController*)segue.destinationViewController viewControllers][0];
		graphViewController.delegate = self;
		graphViewController.monthNumber = self.monatAlsZahl;
		graphViewController.graphTitle = self.title;
    }
    
}

- (NSArray *)dataForGraphStyle:(GraphStyle)graphStyle
{
	NSMutableArray *array = [NSMutableArray array];
	
	switch (graphStyle)
	{
		case GraphStyleTemperature:
			for (Weatherdata *weatherData in self.data)
			{
				[array addObject:@(weatherData.temperatur)];
			}
			break;
			
		case GraphStyleMaxTemperature:
			for (Weatherdata *weatherData in self.data)
			{
				[array addObject:@(weatherData.maxTemperatur)];
			}
			break;
			
		case GraphStyleMinTemperature:
			for (Weatherdata *weatherData in self.data)
			{
				[array addObject:@(weatherData.minTemperatur)];
			}
			break;
			
		case GraphStyleAirPressure:
			for (Weatherdata *weatherData in self.data)
			{
				[array addObject:@(weatherData.luftdruck)];
			}
			break;
			
		case GraphStyleHumidity:
			for (Weatherdata *weatherData in self.data)
			{
				[array addObject:@(weatherData.maxTemperatur)];
			}
			break;
			
		case GraphStyleMaxWindSpeed:
			for (Weatherdata *weatherData in self.data)
			{
				[array addObject:@(weatherData.maxwind)];
			}
			break;
			
		case GraphStyleVisibility:
			for (Weatherdata *weatherData in self.data)
			{
				[array addObject:@(weatherData.sichtweite)];
			}
			break;
			
		case GraphStyleWindSpeed:
			for (Weatherdata *weatherData in self.data)
			{
				[array addObject:@(weatherData.windgeschwindigkeit)];
			}
			break;
			
		case GraphStylePerceptionRain:
			for (Weatherdata *weatherData in self.data)
			{
				[array addObject:@(weatherData.niederschlag)];
			}
			break;
			
		default:
			break;
	}
	
	return array;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end

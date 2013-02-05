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

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSDateFormatter *inputFormatter;
@property (nonatomic, strong) NSDateFormatter *outputFormatter;



@end

@implementation TableViewController

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
    NSLog(@"%i",self.year);
    NSLog(@"%i",self.monatAlsZahl);
    
    NSArray *monthNames = [[[NSDateFormatter alloc] init] monthSymbols];
    //monthNames = [NSString stringWithFormat:@"%i",self.monatAlsZahl];
    self.title = [NSString stringWithFormat:@"%@", monthNames[self.monatAlsZahl -1]];
    
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
            NSLog(@"%@", [dateString substringWithRange:NSMakeRange(0, 4)]);
            
            if (self.year == [[dateString substringWithRange:NSMakeRange(0, 4)] intValue] && self.monatAlsZahl == [[dateString substringWithRange:NSMakeRange(5, 2)] intValue])
            {
                [self.data addObject:[Weatherdata createWeatherdatafromArray:dataArray]];

                NSLog(@"Alles gleich");
                continue;
            }
            
            
    
			NSLog(@"%@", dataArray); // Anzeige der Werte in der Konsole
		
        
        
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
    int row = self.tableView.indexPathForSelectedRow.row;
    
    ((DayViewController*)segue.destinationViewController).data = self.data[row];
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end

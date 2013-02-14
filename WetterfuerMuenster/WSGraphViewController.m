//
//  WSGraphViewController.m
//  WeatherStation
//
//  Created by Benni on 23.01.13.
//  Copyright (c) 2013 Ifgi. All rights reserved.
//

#import "WSGraphViewController.h"

@interface WSGraphViewController () <CPTPlotDataSource>

@property (nonatomic, strong) CPTGraphHostingView *hostView;
@property (nonatomic, assign) GraphStyle selectedStyle;
@property (nonatomic, strong) NSArray *graphStyleNames;
@property (nonatomic, strong) NSArray *graphStyleUnits;
@property (nonatomic, strong) NSArray *majorIncrements;
@property (nonatomic, strong) NSArray *minorIncrements;
@property (nonatomic, strong) NSArray *graphData;

@end

@implementation WSGraphViewController

#pragma mark - UIViewController lifecycle methods

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
	
	self.selectedStyle = GraphStyleTemperature;
	
	self.graphStyleNames = (@[
							@"Durchschnittliche Temperatur",
							@"Maximale Temperatur",
							@"Minimale Temperatur",
							@"Luftfeuchtigkeit",
							@"Durchschnittliche Windgeschwindigkeit",
							@"Maximale Windgeschwindigkeit",
							@"Sichtweite",
							@"Niederschlag (Regen)",
							@"Luftdruck",
							]);
	
	self.graphStyleUnits = (@[
							@"°C",
							@"°C",
							@"°C",
							@"%",
							@"m/s",
							@"m/s",
							@"m",
							@"mm",
							@"hPa",
							]);
	
	self.majorIncrements = (@[
							@5,
							@5,
							@5,
							@10,
							@5,
							@2,
							@100,
							@1,
							@10,
							]);
	
	self.minorIncrements = (@[
							@1,
							@1,
							@1,
							@10,
							@1,
							@2,
							@100,
							@1,
							@10,
							]);
	
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
	[self.view addGestureRecognizer:tapGesture];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	
	if (!self.delegate)
	{
		[NSException raise:@"Delegate exception" format:@"Delegate property not set"];
	}
	
	if (![self.delegate respondsToSelector:@selector(dataForGraphStyle:)])
	{
		[NSException raise:@"Delegate exception" format:@"Delegate does not implement dataForGraphStyle:"];
	}
	
	self.graphData = [self.delegate dataForGraphStyle:self.selectedStyle];
	
    // The plot is initialized here, since the view bounds have not transformed for landscape until now
    [self initPlot];
}

#pragma mark - CPTPlotDataSource methods

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return self.graphData.count;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
	switch (fieldEnum)
	{
		case CPTScatterPlotFieldX:
			if (index < self.graphData.count)
			{
				return [NSNumber numberWithUnsignedInteger:index];
			}
			
			break;
		case CPTScatterPlotFieldY:
		{
			return self.graphData[index];
			
			break;
		}
	}
	
	return [NSDecimalNumber zero];
}

#pragma mark - Private Methods

- (IBAction)doneButtonPressed:(id)sender
{
	[self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)handleTap:(UITapGestureRecognizer*)tapGesture
{
	if (!self.delegate)
	{
		[NSException raise:@"Delegate Exception" format:@"Delegate of GraphViewController not set"];
		abort();
	}
	else
	{
		if (![self.delegate respondsToSelector:@selector(dataForGraphStyle:)])
		{
			[NSException raise:@"Delegate Exception" format:@"Delegate of GraphViewController does not implement dataForGraphStyle method"];
			abort();
		}
	}
	
	self.selectedStyle = (self.selectedStyle == 8) ? 0 : self.selectedStyle + 1;
	self.graphData = [self.delegate dataForGraphStyle:self.selectedStyle];
	[self initPlot];
	
	[self.hostView.hostedGraph reloadData];
}

-(void)initPlot
{
	[self configureHost];
    [self configureGraph];
    [self configureChart];
    [self configureAxes];
}

-(void)configureHost
{
	// 1 - Set up view frame
	CGRect parentRect = self.view.bounds;
	
	// 2 - Create host view
	[self.hostView removeFromSuperview];
	self.hostView = nil;
	self.hostView = [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame:parentRect];
	self.hostView.allowPinchScaling = YES;
	self.hostView.autoresizingMask = (UIViewAutoresizingFlexibleHeight |
									  UIViewAutoresizingFlexibleWidth |
									  UIViewAutoresizingFlexibleLeftMargin |
									  UIViewAutoresizingFlexibleRightMargin |
									  UIViewAutoresizingFlexibleTopMargin |
									  UIViewAutoresizingFlexibleBottomMargin);
	[self.view addSubview:self.hostView];
}

-(void)configureGraph
{
	// 1 - Create the graph
	CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
	[graph applyTheme:[CPTTheme themeNamed:kCPTSlateTheme]];
	self.hostView.hostedGraph = graph;
	
	
	// 2 - Set graph title
	self.title = [NSString stringWithFormat:@"%@ - %@", self.graphStyleNames[self.selectedStyle], self.graphTitle];
	
	
	// 3 - Create and set text style
	CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
	titleStyle.color = [CPTColor whiteColor];
	titleStyle.fontName = @"Helvetica-Bold";
	titleStyle.fontSize = 16.0f;
	graph.titleTextStyle = titleStyle;
	graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
	graph.titleDisplacement = CGPointMake(0.0f, 10.0f);
	
	
	// 4 - Set padding for plot area
	[graph.plotAreaFrame setPaddingLeft:20.0f];
	//[graph.plotAreaFrame setPaddingBottom:0.0f];
	
	
	// 5 - Enable user interactions for plot space
	CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
	plotSpace.allowsUserInteraction = YES;
}

-(void)configureChart
{
	// 1 - Get graph and plot space
	CPTGraph *graph = self.hostView.hostedGraph;
	CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
	
	// 2 - Create the three plots
	CPTScatterPlot *tempPlot = [[CPTScatterPlot alloc] init];
	tempPlot.dataSource = self;
	tempPlot.identifier = @"temp";
	CPTColor *tempColor = [CPTColor greenColor];
	[graph addPlot:tempPlot toPlotSpace:plotSpace];
	
	
	// 3 - Set up plot space
	[plotSpace scaleToFitPlots:[NSArray arrayWithObjects:tempPlot, nil]];
	
	CPTMutablePlotRange *xRange = [plotSpace.xRange mutableCopy];
	[xRange expandRangeByFactor:CPTDecimalFromCGFloat(1.1f)];
	plotSpace.xRange = xRange;
	
	CPTMutablePlotRange *yRange = [plotSpace.yRange mutableCopy];
	[yRange expandRangeByFactor:CPTDecimalFromCGFloat(1.2f)];
	plotSpace.yRange = yRange;
	
	
	// 4 - Create styles and symbols
	CPTMutableLineStyle *tempLineStyle = [tempPlot.dataLineStyle mutableCopy];
	tempLineStyle.lineWidth = 2.5;
	tempLineStyle.lineColor = tempColor;
	tempPlot.dataLineStyle = tempLineStyle;
	
}

-(void)configureAxes
{
	// 1 - Create styles
	CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
	axisTitleStyle.color = [CPTColor whiteColor];
	axisTitleStyle.fontName = @"Helvetica-Bold";
	axisTitleStyle.fontSize = 10.0f;
	
	CPTMutableLineStyle *axisLineStyle = [CPTMutableLineStyle lineStyle];
	axisLineStyle.lineWidth = 1.0f;
	axisLineStyle.lineColor = [CPTColor whiteColor];
	
	CPTMutableTextStyle *axisTextStyle = [[CPTMutableTextStyle alloc] init];
	axisTextStyle.color = [CPTColor whiteColor];
	axisTextStyle.fontName = @"Helvetica-Bold";
	axisTextStyle.fontSize = 10.0f;
	
	CPTMutableLineStyle *majorTickLineStyle = [CPTMutableLineStyle lineStyle];
	majorTickLineStyle.lineColor = [CPTColor whiteColor];
	majorTickLineStyle.lineWidth = 2.0f;
	
	CPTMutableLineStyle *minorTickLineStyle = [CPTMutableLineStyle lineStyle];
	minorTickLineStyle.lineColor = [CPTColor whiteColor];
	minorTickLineStyle.lineWidth = 1.0f;
	
	CPTMutableLineStyle *gridLineStyle = [CPTMutableLineStyle lineStyle];
	gridLineStyle.lineColor = [CPTColor colorWithComponentRed:1.0 green:1.0 blue:1.0 alpha:0.4];
	gridLineStyle.lineWidth = 1.0f;
	
	// 2 - Get axis set
	CPTXYAxisSet *axisSet = (CPTXYAxisSet *) self.hostView.hostedGraph.axisSet;
	
	
	// 3 - Configure x-axis
	CPTAxis *x = axisSet.xAxis;
	x.axisLineStyle = axisLineStyle;
	x.labelingPolicy = CPTAxisLabelingPolicyNone;
	x.labelTextStyle = axisTextStyle;
	x.labelOffset = -8.0f;
	x.majorTickLineStyle = majorTickLineStyle;
	x.majorGridLineStyle = gridLineStyle;
	x.majorTickLength = 4.0f;
	x.minorTickLineStyle = minorTickLineStyle;
	x.minorTickLength = 3.0f;
	x.tickDirection = CPTSignNone;
	
	NSInteger xMajorIncrement = 5;
	NSInteger xMinorIncrement = 1;
	CGFloat xMax = self.graphData.count - 1;  // should determine dynamically based on max price
	CGFloat xMin = 0.0f;  // should determine dynamically based on max price
	NSMutableSet *xLabels = [NSMutableSet set];
	NSMutableSet *xMajorLocations = [NSMutableSet set];
	NSMutableSet *xMinorLocations = [NSMutableSet set];
	
	for (NSInteger j = xMin; j <= xMax; j += xMinorIncrement)
	{
		NSUInteger mod = j % xMajorIncrement;
		
		if (mod == 0 && j > 0)
		{
			CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:[NSString stringWithFormat:@"%i.%i.", j, self.monthNumber] textStyle:x.labelTextStyle];
			NSDecimal location = CPTDecimalFromInteger(j);
			label.tickLocation = location;
			label.offset = -x.majorTickLength - x.labelOffset;
			[xLabels addObject:label];
			
			[xMajorLocations addObject:[NSDecimalNumber decimalNumberWithDecimal:location]];
		}
		else
		{
			[xMinorLocations addObject:[NSDecimalNumber decimalNumberWithDecimal:CPTDecimalFromInteger(j)]];
		}
	}
	
	x.axisLabels = xLabels;
	x.majorTickLocations = xMajorLocations;
	x.minorTickLocations = xMinorLocations;
	
	
	// 4 - Configure y-axis
	CPTAxis *y = axisSet.yAxis;
	y.axisLineStyle = axisLineStyle;
	y.majorGridLineStyle = gridLineStyle;
	y.labelingPolicy = CPTAxisLabelingPolicyNone;
	y.labelTextStyle = axisTextStyle;
	y.labelOffset = -10.0f;
	y.majorTickLineStyle = majorTickLineStyle;
	y.majorTickLength = 4.0f;
	y.minorTickLength = 3.0f;
	y.minorTickLineStyle = minorTickLineStyle;
	y.tickDirection = CPTSignNone;
	
	NSInteger yMajorIncrement = [self.majorIncrements[self.selectedStyle] intValue];
	NSInteger yMinorIncrement = [self.minorIncrements[self.selectedStyle] intValue];
	CGFloat yMax = [self getMaximumValue];  // should determine dynamically based on max price
	CGFloat yMin = [self getMinimumValue];  // should determine dynamically based on max price
	NSMutableSet *yLabels = [NSMutableSet set];
	NSMutableSet *yMajorLocations = [NSMutableSet set];
	NSMutableSet *yMinorLocations = [NSMutableSet set];
	
	for (NSInteger j = yMin; j <= yMax; j += yMinorIncrement)
	{
		NSUInteger mod = j % yMajorIncrement;
		
		if (mod == 0)
		{
			CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:[NSString stringWithFormat:@"%i %@", j, self.graphStyleUnits[self.selectedStyle]] textStyle:y.labelTextStyle];
			NSDecimal location = CPTDecimalFromInteger(j);
			label.tickLocation = location;
			label.offset = -y.majorTickLength - y.labelOffset;
			
			if (label)
			{
				[yLabels addObject:label];
			}
			
			[yMajorLocations addObject:[NSDecimalNumber decimalNumberWithDecimal:location]];
		}
		else
		{
			[yMinorLocations addObject:[NSDecimalNumber decimalNumberWithDecimal:CPTDecimalFromInteger(j)]];
		}
	}
	
	y.axisLabels = yLabels;
	y.majorTickLocations = yMajorLocations;
	y.minorTickLocations = yMinorLocations;
}

- (CGFloat)getMaximumValue
{
	CGFloat maximumValue = -50000.0;
	
	for (NSNumber *number in self.graphData)
	{
		maximumValue = MAX(number.floatValue, maximumValue);
	}
	
	return maximumValue;
}

- (CGFloat)getMinimumValue
{
	CGFloat minimumValue = 50000.0;
	
	for (NSNumber *number in self.graphData)
	{
		minimumValue = MIN(number.floatValue, minimumValue);
	}
	
	return minimumValue;
}


- (IBAction)infoPressed:(id)sender {
        UIAlertView *info = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Um die anderen Werte zu erhalten auf den Graphen tippen!" delegate:nil cancelButtonTitle:@"Alles Klar!" otherButtonTitles:nil, nil];
    [info show];
    
}
 

- (void)viewDidUnload {
    
    [super viewDidUnload];
}

@end

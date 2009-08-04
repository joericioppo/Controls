//
//  ControlsViewController.m
//  Controls
//
//  Created by test on 8/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ControlsViewController.h"

@interface	ControlsViewController(private)

#pragma mark Private

- (void)setupPadControl;
- (void)setupSlideControl;
- (void)setupMarker;
@end

#pragma mark -

@implementation ControlsViewController


- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	[self setupPadControl];
	[self setupSlideControl];
	[self setupMarker];
	[self updateCurrentColorAnimated:NO];
}


- (void)setupPadControl
{
	padControl = [[AIPadControl alloc] initWithFrame:CGRectMake(20.0, 50.0, 280.0, 280.0)];
	
	[self.view addSubview:padControl];
	
	[padControl release];
	
	colorLayer					= [CALayer layer];
	colorLayer.frame			= padControl.bounds;
	colorLayer.backgroundColor	= [UIColor grayColor].CGColor;
	colorLayer.borderColor		= [UIColor grayColor].CGColor;
	colorLayer.cornerRadius		= 14.0;
	
	hexPattern					= [CALayer layer];
	hexPattern.frame			= colorLayer.frame;
	
	CGImageRef hexRef			= [UIImage imageNamed:@"hex-pattern.png"].CGImage;
	hexPattern.contents			= (id)hexRef;
	
	[padControl.layer addSublayer:hexPattern];
	[padControl.layer addSublayer:colorLayer];
	
	padControl.delegate	= self;
}


- (void)setupSlideControl
{
	slideControl = [[AISlideControl alloc] initWithFrame:CGRectMake(20.0, 370.0, 280.0, 28.0)];
	
	slideControl.backgroundColor = [UIColor clearColor];
	
	slideControl.layer.backgroundColor = [UIColor grayColor].CGColor;
	
	slideControl.layer.cornerRadius	= 14.0;
	
	[self.view addSubview:slideControl];
	
	[slideControl release];
	
	slideControl.delegate = self;
}


- (void)setupMarker
{
	marker = [CALayer layer];
	
	marker.frame = CGRectMake(0.0, 0.0, 10.0, 10.0);
	
	marker.backgroundColor = [UIColor grayColor].CGColor;
	
	marker.cornerRadius = 6.0;
	
	marker.position = CGPointMake(slideControl.frame.size.width*slideControl.xValue, -8.0);
	
	[slideControl.layer addSublayer:marker];
}


- (void)updateCurrentColorAnimated:(BOOL)animated
{
	currentColor = [UIColor colorWithHue:0.625
							  saturation:padControl.xValue
							  brightness:padControl.yValue
								   alpha:slideControl.xValue];
								   
	if (animated == YES) 
	{
		colorLayer.backgroundColor = currentColor.CGColor;
	}
	
	if (animated == NO)
	{
		[CATransaction begin];
		
		[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
		
		colorLayer.backgroundColor = currentColor.CGColor;
		
		[CATransaction commit];
	}
}


- (void)touchBeganInPadControl
{
	
}


- (void)touchMovedInPadControl
{
	
}


- (void)touchBeganInSlideControl
{
	marker.position = CGPointMake(slideControl.frame.size.width*slideControl.xValue, -8.0);
}


- (void)touchMovedInSlideControl
{
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue
					 forKey:kCATransactionDisableActions];	
	marker.position = CGPointMake(slideControl.frame.size.width*slideControl.xValue, -8.0);
	
	[CATransaction commit];
}


- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
    [super dealloc];
}

@end

//
//  AIColorView.m
//  ColorDev
//
//  Created by test on 4/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AIPadControl.h"

@implementation AIPadControl

@synthesize xValue;
@synthesize yValue;
@synthesize location;
@synthesize previousLocation;
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame 
{
    if (self = [super initWithFrame:frame]) {

		xValue = 0.0;
		yValue = 0.5;
	
	}
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
	
	location = [[touches anyObject] locationInView:self];
	xValue = location.x/self.bounds.size.width;
	
	//Flip cooridinates
	yValue = (self.bounds.size.height-location.y)/(self.bounds.size.height);

	if([delegate respondsToSelector:@selector(updateCurrentColorAnimated:)]) {
        [delegate updateCurrentColorAnimated:YES];
    }	
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	
	location = [[touches anyObject] locationInView:self];

	//Percentage of screen.	
	xValue = location.x/self.bounds.size.width;

		//Clipping
		if (xValue > 1.0) {
			xValue = 1.0;
		}
		if (xValue < 0.0) {
			xValue = 0.0;
		}						

	//Percentage of screen flipped so bright is up and dark is down.
	yValue = (self.bounds.size.height-location.y)/(self.bounds.size.height);

		//Clipping
		if (yValue > 1.0) {
			yValue = 1.0;
		}
		if (yValue < 0.0) {
			yValue = 0.0;
		}
	
	previousLocation = location;
	
	if([delegate respondsToSelector:@selector(updateCurrentColorAnimated:)]) {
        [delegate updateCurrentColorAnimated:NO];
        }
	
}

- (void)dealloc {
    [super dealloc];
}


@end

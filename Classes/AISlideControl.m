//
//  AIAlphaSlider.m
//  ColorDev
//
//  Created by test on 4/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AISlideControl.h"

@implementation AISlideControl

@synthesize xValue;
@synthesize location;
@synthesize previousLocation;
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		
		xValue = 1.0;
    }
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	location = [[touches anyObject] locationInView:self];
	
	xValue = location.x/self.bounds.size.width;
	
	if([delegate respondsToSelector:@selector(touchBeganInSlideControl)]) 
	{
        [delegate touchBeganInSlideControl];
	}
	
	if([delegate respondsToSelector:@selector(updateCurrentColorAnimated:)]) 
	{
        [delegate updateCurrentColorAnimated:YES];
        }
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	location = [[touches anyObject] locationInView:self];
	
	//Percentage of screen
	xValue = location.x/self.bounds.size.width;	

	if (xValue > 1.0) 
	{
		xValue = 1.0;
	}
	if (xValue < 0.0) 
	{
		xValue = 0.0;
	}
	
	if([delegate respondsToSelector:@selector(updateCurrentColorAnimated:)]) {
        [delegate updateCurrentColorAnimated:NO];
        }

	if([delegate respondsToSelector:@selector(touchMovedInSlideControl)]) 
	{
        [delegate touchMovedInSlideControl];
	}
}


//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//
//	if([delegate respondsToSelector:@selector(touchEndedInSlider)]) {
//        [delegate touchEndedInSlider];
//	}
//}


- (void)dealloc {
    [super dealloc];
}


@end

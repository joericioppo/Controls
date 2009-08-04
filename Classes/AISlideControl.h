//
//  AIAlphaSlider.h
//  ColorDev
//
//  Created by test on 4/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlsViewController.h"

@interface AISlideControl : UIView {

	id		delegate;

	CGPoint location;
	CGPoint previousLocation;
	
	float	xValue;

}
@property float		  xValue;
@property CGPoint	  location;
@property CGPoint	  previousLocation;
@property (assign) id delegate;	
@end

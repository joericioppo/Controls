//
//  AIColorView.h
//  ColorDev
//
//  Created by test on 4/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlsViewController.h"

@interface AIPadControl : UIView {

	id delegate;
	
	CGPoint location;
	CGPoint previousLocation;
	
	float xValue;
	float yValue;
}

@property float xValue;
@property float yValue;
@property CGPoint location;
@property CGPoint previousLocation;
@property (assign) id delegate;

@end

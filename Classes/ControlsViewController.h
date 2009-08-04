//
//  ControlsViewController.h
//  Controls
//
//  Created by test on 8/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AIPadControl.h"
#import "AISlideControl.h"

@class AIPadControl;
@class AISlideControl;

@interface ControlsViewController : UIViewController {

	AIPadControl	*padControl;
	AISlideControl	*slideControl;
	
	CALayer			*colorLayer;
	CALayer			*hexPattern;
	CALayer			*sliderLayer;
	
	CALayer			*marker;
	
	UIColor			*currentColor;
}

- (void)updateCurrentColorAnimated:(BOOL)animated;
- (void)touchBeganInPadControl;
- (void)touchMovedInPadControl;
- (void)touchBeganInSlideControl;
- (void)touchMovedInSlideControl; 

@end


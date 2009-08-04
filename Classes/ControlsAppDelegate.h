//
//  ControlsAppDelegate.h
//  Controls
//
//  Created by test on 8/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ControlsViewController;

@interface ControlsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ControlsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ControlsViewController *viewController;

@end


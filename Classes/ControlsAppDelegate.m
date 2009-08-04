//
//  ControlsAppDelegate.m
//  Controls
//
//  Created by test on 8/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ControlsAppDelegate.h"
#import "ControlsViewController.h"

@implementation ControlsAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

//
//  AppDelegate.h
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 19.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Trainingsmodule.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** Singleton data model */
@property (strong, nonatomic) Trainingsmodule* trainingsmodule;

/** Helper to get static instance */
+ (AppDelegate*) appDelegate;

@end

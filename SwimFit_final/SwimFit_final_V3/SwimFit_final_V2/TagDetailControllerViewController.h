//
//  TagDetailControllerViewController.h
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 20.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Location;

@interface TagDetailControllerViewController : UITableViewController

@property (strong, nonatomic) Trainingsmodul* trainingsmodul;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@end
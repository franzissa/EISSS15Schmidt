//
//  DataViewController.h
//  SwimFit2.0
//
//  Created by Franziska Schmidt on 07.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end


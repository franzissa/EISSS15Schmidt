//
//  DetailViewController.h
//  SwimfitV1.1
//
//  Created by Franziska Schmidt on 07.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end


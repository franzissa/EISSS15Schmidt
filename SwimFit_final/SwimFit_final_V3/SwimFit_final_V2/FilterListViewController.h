//
//  FilterListViewController.h
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 20.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryDelegate <NSObject>

- (void) selectedCategories:(NSArray*)array;

@end

@interface FilterListViewController : UITableViewController
@property (nonatomic, weak) id<CategoryDelegate> delegate;

- (instancetype) initWithSelectedCategories:(NSArray*)selections deleagte:(id<CategoryDelegate>)delegate;

@end

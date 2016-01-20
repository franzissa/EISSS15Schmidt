//
//  Categories.h
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 20.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>

/** The Categories represents the list of available tag categories. Locations can have multiple. */
@interface Categories : NSObject

+ (NSArray*) allCategories;
+ (NSArray*) activeCategories;

+ (NSArray*) filteredCategories;
+ (void) setFilteredCategories:(NSArray*)categories;


+ (BOOL) filterOnFor:(NSString*)category;
+ (void) setFilter:(NSString*)category on:(BOOL)on;

+ (NSString*) query;

@end

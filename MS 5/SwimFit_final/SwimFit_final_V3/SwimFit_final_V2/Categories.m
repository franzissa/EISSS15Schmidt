//
//  Categories.m
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 20.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import "Categories.h"
#import "AppDelegate.h"

@implementation Categories

static NSMutableDictionary* categoryMeta;

+ (void)initialize
{
    categoryMeta = [NSMutableDictionary dictionary];
}


+ (NSArray*) allCategories
{
    static NSArray* defaultCategories;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultCategories = @[
                              @"Anfänger",
                              @"Fortgeschrittener",
                              @"Profi"
                             
                              ];
    });
    
    NSMutableSet* maxCategories = [NSMutableSet setWithArray:defaultCategories];
    [maxCategories addObjectsFromArray:[self activeCategories]];
    return [maxCategories allObjects];
}


+ (NSArray*) activeCategories
{
    NSArray* trainingsmodule = [[AppDelegate appDelegate].trainingsmodule filteredTrainingsmodule];
    NSArray* a = [trainingsmodule valueForKeyPath:@"categories"];
    NSMutableSet* categorySet = [NSMutableSet set];
    for (NSArray* categories in a) {
        [categorySet addObjectsFromArray:categories];
    }
    return [categorySet allObjects];
}

+ (NSArray*) filteredCategories:(BOOL) quote
{
    NSMutableArray* a = [NSMutableArray array];
    [categoryMeta enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj boolValue]) {
            if (quote) {
                [a addObject:[NSString stringWithFormat:@"\"%@\"", key]];
            } else {
                [a addObject:key];
            }
        }
    }];
    return a;
}

+ (NSArray*) filteredCategories
{
    return [self filteredCategories:NO];
}


+ (BOOL) filterOnFor:(NSString*)category
{
    return [categoryMeta[category] boolValue];
}

+ (void) setFilter:(NSString*)category on:(BOOL)on
{
    categoryMeta[category] = @(on);
}

+ (void) setFilteredCategories:(NSArray*)categories
{
    [categoryMeta removeAllObjects];
    for (NSString* key in categories) {
        categoryMeta[key] = @(YES);
    }
}

+ (NSString*) query
{
    return nil;
}


@end

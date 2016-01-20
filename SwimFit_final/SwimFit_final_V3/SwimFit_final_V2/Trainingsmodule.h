//
//  Trainingsmodule.h
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 20.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//


#import <Foundation/Foundation.h>


@class Trainingsmodul;

@protocol TrainingsmodulModelDelegate <NSObject>

- (void) modelUpdated;

@end

@interface Trainingsmodule : NSObject

@property (nonatomic, weak) id<TrainingsmodulModelDelegate> delegate;

- (NSArray*) filteredTrainingsmodule;
- (void) addLocation:(Trainingsmodul*)trainingsodul;

- (void) import;
- (void) persist:(Trainingsmodul*)trainingsmodul;

- (void) runQuery:(NSString*)queryString;

@end

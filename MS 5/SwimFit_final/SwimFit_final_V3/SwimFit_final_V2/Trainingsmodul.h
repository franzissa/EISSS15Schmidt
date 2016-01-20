//
//  Trainingsmodul.h
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 20.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Trainingsmodul : NSObject



@property (nonatomic, copy) NSString* _id;
@property (nonatomic, copy) NSString* modulname;
@property (nonatomic, copy) NSString* gruppe;
@property (nonatomic, copy) NSString* strecke;
@property (nonatomic, copy) NSString* lage;
@property (nonatomic, copy) NSString* zeit;
@property (nonatomic, copy) NSString* puls;



@property (nonatomic, retain, readonly) NSMutableArray* categories;

/** This property starts out YES until modified manually or loaded from the network. This way dragging the pin will update the coordinates and geocoded info */
@property (nonatomic) BOOL configuredBySystem;



#pragma mark - JSON-ification

- (instancetype) initWithDictionary:(NSDictionary*)dictionary;
- (NSDictionary*) toDictionary;

@end

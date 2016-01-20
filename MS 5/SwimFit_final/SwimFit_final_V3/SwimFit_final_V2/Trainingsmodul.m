//
//  Trainingsmodul.m
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 20.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//
#import "Trainingsmodul.h"

#define safeSet(d,k,v) if (v) d[k] = v;

@interface Trainingsmodul ()
@property (nonatomic, retain) id trainingsmodul;

@end

@implementation Trainingsmodul


- (instancetype) init
{
    self = [super init];
    if (self) {
        _categories = [NSMutableArray array];
    }
    return self;
}

#pragma mark - serialization

- (instancetype) initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        self.modulname = dictionary[@"modulname"];
        self.gruppe = dictionary[@"gruppe"];
        self.strecke = dictionary[@"strecke"];
        self.lage = dictionary[@"lage"];
        self.zeit = dictionary[@"zeit"];
        self.puls = dictionary[@"puls"];
        _categories = [NSMutableArray arrayWithArray:dictionary[@"categories"]];
    }
    return self;
}
- (NSDictionary*) toDictionary
{
    NSMutableDictionary* jsonable = [NSMutableDictionary dictionary];
    safeSet(jsonable, @"modulname", self.modulname);
    safeSet(jsonable, @"gruppe", self.gruppe);
    safeSet(jsonable, @"strecke", self.strecke);
    safeSet(jsonable, @"lage", self.lage);
    safeSet(jsonable, @"zeit", self.zeit);
    safeSet(jsonable, @"puls", self.puls);


    
    
    safeSet(jsonable, @"categories", self.categories);
    safeSet(jsonable, @"_id", self._id);
    return jsonable;
}
@end




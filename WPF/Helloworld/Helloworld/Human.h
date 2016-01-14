//
//  Human.h
//  Helloworld
//
//  Created by Franziska Schmidt on 05.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Singer

- (void)sing;

@end

@interface Human : NSObject <Singer>

@property (copy) NSString *name;

-(instancetype)initWithName:(NSString*)name;

- (void)think;

@end

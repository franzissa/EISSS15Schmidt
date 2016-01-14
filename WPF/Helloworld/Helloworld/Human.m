//
//  Human.m
//  Helloworld
//
//  Created by Franziska Schmidt on 05.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import "Human.h"

@implementation Human

- (instancetype)initWithName:(NSString *)name{
    
    self = [super init];
    
    if(self) {
        self.name = name;
    }
    return self;
}

-(void)think {
    NSLog(@"I think, hence I am");
}

-(void)sing {
    NSLog(@"Tralalala");
}
- (NSString *)description{

return self.name;

}

@end

//
//  Trainingsmodule.m
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 20.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//


#import "Trainingsmodule.h"
#import "Trainingsmodul.h"

static NSString* const kBaseURL = @"http://localhost:3000/";
static NSString* const kTrainingsmodule = @"trainingsmodule";
static NSString* const kFiles = @"files";


@interface Trainingsmodule ()
@property (nonatomic, strong) NSMutableArray* objects;
@end

@implementation Trainingsmodule

- (id)init
{
    self = [super init];
    if (self) {
        _objects = [NSMutableArray array];
    }
    return self;
}

- (NSArray*) filteredTrainingsmodule
{
    return [self objects];
}

- (void) addTrainingsmodul:(Trainingsmodul*)trainingsmodul
{
    [self.objects addObject:trainingsmodul];
}


- (void)parseAndAddTrainingsmodul:(NSArray*)Trainingsmodule toArray:(NSMutableArray*)destinationArray
{
    for (NSDictionary* item in Trainingsmodule) {
        Trainingsmodul* trainingsmodul = [[trainingsmodul alloc] initWithDictionary:item];
        [destinationArray addObject:trainingsmodul];
        
        
    }
    
    if (self.delegate) {
        [self.delegate modelUpdated];
    }
}
- (void)import
{
    NSURL* url = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:Trainingsmodule]];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            NSArray* responseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            [self parseAndAddLocations:responseArray toArray:self.objects]; //7
        }
    }];
    
    [dataTask resume];
}

- (void) runQuery:(NSString *)queryString
{
    
}




    
    

    
    
    NSString* trainingsmodule = [kBaseURL stringByAppendingPathComponent:kTrainingsmodule];
    
    BOOL isExistingTrainingsmodul = trainingsmodule._id != nil;
    NSURL* url = isExistingTrainingsmodul ? [NSURL URLWithString:[trainingsmodule stringByAppendingPathComponent:trainingsmodul._id]] :
    [NSURL URLWithString:trainingsmodul];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = isExistingTrainingsmodul ? @"PUT" : @"POST";
    
    NSData* data = [NSJSONSerialization dataWithJSONObject:[trainingsmodul toDictionary] options:0 error:NULL];
    request.HTTPBody = data;
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"]; //4
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (!error) {
            NSArray* responseArray = @[[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]];
            [self parseAndAddLocations:responseArray toArray:self.objects];
        }
    }];
    [dataTask resume];
}



}
@end

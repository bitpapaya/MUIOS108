//
//  Route.m
//  MUIOS108
//
//  Created by Max Krylov on 3/22/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "Route.h"
#import "Bus.h"


@implementation Route

@dynamic route_description;
@dynamic route_price;
@dynamic route_title;
@dynamic buses;

- (BOOL)initWithDictionary:(NSDictionary *)dict context:(NSManagedObjectContext*)context{
    
    if(dict.count <=0)
        return NO;
    
    Route* route = [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:context];
    route.route_title = dict[@"route_title"];
    route.route_price = dict[@"route_price"];
    route.route_description = dict[@"route_description"];
    
    NSError* error;
    [context save:&error];
    
    if(error){
        NSLog(@"%@", error);
        return NO;
    }
    
    return YES;
}

//- (Route *)initWithDictionary:(NSDictionary *)dict {
//    
//    
//    self = [super init];
//    
//    if(self){
//        self.route_title = dict[@"route_title"];
//        self.route_price = dict[@"route_price"];
//        self.route_description = dict[@"route_description"];
//    }
//    
//
//    return self;
//}

@end

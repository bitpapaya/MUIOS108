//
//  Route.m
//  MUIOS108
//
//  Created by Max Krylov on 3/9/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "Route.h"

@implementation Route


- (Route *)routeWithTitle:(NSString *)title price:(NSString *)price description:(NSString *)description {
    Route *route = [[Route alloc] init];
    route.title = title;
    route.price = price;
    route.description = description;

    return route;
}
    
    
@end

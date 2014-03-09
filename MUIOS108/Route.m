//
//  Route.m
//  MUIOS108
//
//  Created by Max Krylov on 3/9/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "Route.h"

@implementation Route

+ (Route *)createRandomRoute
{
    NSString *title = [NSString stringWithFormat:@"%d%@", arc4random() % 99, arc4random() % 2 ? @"K" : @"E"];

    Route *route = [[Route alloc] init];
    route.title = title;
    route.price = @2.50;
    route.icon = [UIImage imageNamed:@"bus.png"];
    
    return route;
}


@end

//
//  Route.h
//  MUIOS108
//
//  Created by Max Krylov on 3/9/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property(nonatomic, strong) UIImage *icon;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSNumber *price;

+ (Route *)createRandomRoute;

@end

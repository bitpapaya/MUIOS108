//
//  Route.h
//  MUIOS108
//
//  Created by Max Krylov on 3/9/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *price;
@property(nonatomic, strong) NSString *description;


- (Route *)routeWithTitle:(NSString *)title
                    price:(NSString *)price
                    description:(NSString *)description;

@end

//
//  Bus.h
//  MUIOS108
//
//  Created by Max Krylov on 3/22/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Bus : NSManagedObject

@property (nonatomic, retain) NSString * bus_title;
@property (nonatomic, retain) NSManagedObject *route;

@end

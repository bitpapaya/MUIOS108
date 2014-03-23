//
//  Route.h
//  MUIOS108
//
//  Created by Max Krylov on 3/22/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bus;

@interface Route : NSManagedObject

@property (nonatomic, retain) NSString * route_description;
@property (nonatomic, retain) NSString * route_price;
@property (nonatomic, retain) NSString * route_title;
@property (nonatomic, retain) NSSet *buses;
@end

@interface Route (CoreDataGeneratedAccessors)

- (void)addBusesObject:(Bus *)value;
- (void)removeBusesObject:(Bus *)value;
- (void)addBuses:(NSSet *)values;
- (void)removeBuses:(NSSet *)values;
//- (Route *)initWithDictionary:(NSDictionary *)dict;

- (BOOL)initWithDictionary:(NSDictionary *)dict context:(NSManagedObjectContext*)context;

@end

//
//  MUAPI.h
//  MUIOS108
//
//  Created by Max Krylov on 3/13/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface MUAPI : NSObject


@property (strong, nonatomic) NSManagedObjectContext* context;
@property (strong, nonatomic) NSPersistentStoreCoordinator* coordinator;
@property (strong, nonatomic) NSManagedObjectModel* model;

+(instancetype)sharedClient;

-(void)getRouts:(void (^)(NSError *error)) block;

@end

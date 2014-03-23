//
//  MUAPI.m
//  MUIOS108
//
//  Created by Max Krylov on 3/13/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "MUAPI.h"
#import <AFNetworking.h>
#import "Config.h"
#import "Route.h"
#import "Bus.h"


@implementation MUAPI

static MUAPI* _sharedClient = nil;

+(instancetype)sharedClient {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MUAPI alloc] init];
    });
    
    return _sharedClient;
}

-(void)getRouts:(void (^)(NSError *))block {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    void(^success)(AFHTTPRequestOperation*, id) = ^(AFHTTPRequestOperation *operation, id responce){

        self.model = [NSManagedObjectModel mergedModelFromBundles:nil];
        self.coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
        
        NSString* homeDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
        
        NSString* filePath = [homeDirectory stringByAppendingPathComponent:@"MU108.sqlite"];
        NSURL* storeURL = [NSURL fileURLWithPath:filePath];
        
        NSError* error;
        [self.coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        
        if (error){
            NSLog(@"%@", error);
        }
        
        self.context = [[NSManagedObjectContext alloc] init];
        self.context.persistentStoreCoordinator = self.coordinator;
        
        
        for(NSDictionary* dict in responce){
            [[Route alloc] initWithDictionary:dict context:self.context];
        }
        
        block(error);
    };
    
    void(^fail)(AFHTTPRequestOperation*, NSError*) = ^(AFHTTPRequestOperation *operation, NSError *error){

        block(error);
    };
    
    [manager GET:[NSString stringWithFormat:@"%@%@", API_HOST, API_ROUTS_PATH] parameters:Nil success:success failure:fail];
    
    
    

    
}

@end

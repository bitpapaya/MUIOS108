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


@implementation MUAPI

static MUAPI* _sharedClient = nil;

+(instancetype)sharedClient {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MUAPI alloc] init];
    });
    
    return _sharedClient;
}

-(void)getRouts:(void (^)(NSMutableArray *, NSError *))block {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    void(^success)(AFHTTPRequestOperation*, id) = ^(AFHTTPRequestOperation *operation, id responce){
        NSMutableArray *returnData = [[NSMutableArray alloc] init];
        
        for(NSDictionary* dict in responce){
            Route *route = [[Route alloc] initWithDictionary:dict];
            
            [returnData addObject:route];
        }
        
        block(returnData, nil);
    };
    
    void(^fail)(AFHTTPRequestOperation*, NSError*) = ^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"%@", error);
        block(nil, error);
    };
    
    [manager GET:[NSString stringWithFormat:@"%@%@", API_HOST, API_ROUTS_PATH] parameters:Nil success:success failure:fail];
}

@end

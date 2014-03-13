//
//  MUAPI.h
//  MUIOS108
//
//  Created by Max Krylov on 3/13/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUAPI : NSObject

+(instancetype)sharedClient;

-(void)getRouts:(void (^)(NSMutableArray *routs, NSError *error)) block;

@end

//
//  User.m
//  MUIOS108
//
//  Created by Max Krylov on 2/26/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "User.h"

@implementation User

-(void)logOut{
    NSLog(@"log out user %@", self);
}

-(int)numberOfFriends{
    return 42;
}

-(NSString *)firstName{
    return @"Max";
}

@end

//
//  RouteViewController.h
//  MUIOS108
//
//  Created by Max Krylov on 3/9/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface RouteViewController : UITableViewController<NSFetchedResultsControllerDelegate>

//@property (nonatomic, strong) NSMutableArray *routes;
@property (nonatomic, strong) NSFetchedResultsController* resultsController;
//@property (nonatomic, strong) NSManagedObjectContext* context;

@end

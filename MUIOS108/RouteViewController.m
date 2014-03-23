//
//  RouteViewController.m
//  MUIOS108
//
//  Created by Max Krylov on 3/9/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "RouteViewController.h"
#import "RouteCell.h"
#import "Route.h"
#import <MBProgressHUD.h>
#import <JASidePanelController.h>
#import "MUAPI.h"

@interface RouteViewController ()

@end

@implementation RouteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [[MUAPI sharedClient] fillRouts:^(NSError *error) {
        if(error){
            NSLog(@"%@", error);
            return;
        }
        

        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        
        //хотелось бы оформить getRouts в блок и запускать его в отдельном потоке (или это плохая идея?)
        self.resultsController = [[MUAPI sharedClient] getRouts];
        self.resultsController.delegate = self;
        
        
        //как удачнее пользоваться NSError, чтобы не плодить их по коду, в данном случае?
        NSError* error1 = nil;
        
        if(self.resultsController != nil){
            [self.resultsController performFetch:&error1];
            [self.tableView reloadData];
        }
        else
            NSLog(@"%@", error1);
    }];
    

    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.routes.count;
    NSInteger numberOfRows = 0;
    if([[self.resultsController sections] count] > 0){
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.resultsController sections] objectAtIndex:section];
        numberOfRows = [sectionInfo numberOfObjects];
        
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BasicCell";
    
    RouteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Route* route = (Route*)[self.resultsController objectAtIndexPath:indexPath];
    cell.price.text = [NSString stringWithFormat:@"%@ грн.", route.route_price];
    cell.title.text = route.route_title;
    cell.description.text = route.route_description;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Route* route = (Route*)[self.resultsController objectAtIndexPath:indexPath];
    NSLog(@"Selected route: %@", route.route_title);
}

#pragma mark - Result delegate

/**
 Delegate methods of NSFetchedResultsController to respond to additions, removals and so on.
 */

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
	// The fetch controller is about to start sending change notifications, so prepare the table view for updates.
	[self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
	UITableView *tableView = self.tableView;
    
	switch(type) {
		case NSFetchedResultsChangeInsert:
			[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
            
		case NSFetchedResultsChangeDelete:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
            
		case NSFetchedResultsChangeUpdate:
            //			[self configureCell:(RecipeTableViewCell *)[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
			break;
            
		case NSFetchedResultsChangeMove:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
	}
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
	switch(type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
            
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
	}
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	// The fetch controller has sent all current change notifications, so tell the table view to process all updates.
	[self.tableView endUpdates];
}

@end

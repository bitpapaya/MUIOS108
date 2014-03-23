//
//  RouteViewController.m
//  MUIOS108
//
//  Created by Max Krylov on 3/9/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "RouteViewController.h"
#import "RouteCell.h"
//#import "Route.h"
#import <MBProgressHUD.h>
#import <JASidePanelController.h>
#import "MUAPI.h"

@interface RouteViewController ()

@end

@implementation RouteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [[MUAPI sharedClient] getRouts:^(NSError *error) {
        if(error){
            NSLog(@"%@", error);
            return;
        }

        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
//        self.routes = routs;
        [self.tableView reloadData];
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
    return self.routes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BasicCell";
    
    RouteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    Route* route = (Route*)self.routes[indexPath.row];
//    
//
//    cell.price.text = [NSString stringWithFormat:@"%@ грн.", route.price];
//    cell.title.text = route.title;
//    cell.description.text = route.description;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//     NSLog(@"Selected route: %@", (Route*)[self.routes objectAtIndex:indexPath.row]);
}

@end

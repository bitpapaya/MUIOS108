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
#import <AFNetworking.h>
#import <MBProgressHUD.h>
#import <JASidePanelController.h>

@interface RouteViewController ()

@end

@implementation RouteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//

    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://marshrutki.com.ua/mu/routes.php" parameters:Nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.routes = (NSArray*)responseObject;
        [self.tableView reloadData];
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@", error);
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        
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
    
    cell.price.text = [NSString stringWithFormat:@"%@ грн.", self.routes[indexPath.row][@"route_price"]];

    cell.title.text = self.routes[indexPath.row][@"route_title"];
    cell.description.text = self.routes[indexPath.row][@"route_description"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     NSLog(@"Selected route: %@", [self.routes objectAtIndex:indexPath.row][@"route_title"]);
    
}

@end

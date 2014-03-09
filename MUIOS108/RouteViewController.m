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

@interface RouteViewController ()

@property NSArray *tableData;
@property NSDictionary *buses;

@end

@implementation RouteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.routes = [[NSMutableArray alloc] initWithCapacity:30];
    
    for (int i=0; i<=30; i++)
        [self.routes addObject:[Route createRandomRoute]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.routes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BasicCell";
    
    RouteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.image.image = [self.routes[indexPath.row] icon];
    cell.price.text = [NSString stringWithFormat:@"%@грн.", [self.routes[indexPath.row] price]];
    cell.title.text = [self.routes[indexPath.row] title];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     NSLog(@"Selected route: %@", [[self.routes objectAtIndex:indexPath.row] title]);
}

@end

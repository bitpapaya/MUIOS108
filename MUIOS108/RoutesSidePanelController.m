//
//  RoutesSidePanelController.m
//  MUIOS108
//
//  Created by Max Krylov on 3/9/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "RoutesSidePanelController.h"

@interface RoutesSidePanelController ()

@end

@implementation RoutesSidePanelController

- (void)awakeFromNib {
    [self setLeftPanel:[self.storyboard
        instantiateViewControllerWithIdentifier:@"leftViewController"]];
    [self setCenterPanel:[self.storyboard       instantiateViewControllerWithIdentifier:@"centerViewController"]];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

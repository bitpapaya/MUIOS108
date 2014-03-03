//
//  RegisterViewController.m
//  MUIOS108
//
//  Created by Max Krylov on 3/2/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()


@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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


- (IBAction)hideModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

//
//  ShippingInformationViewController.m
//  Curved App
//
//  Created by Intern on 12/27/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import "ShippingInformationViewController.h"

@interface ShippingInformationViewController ()

@end

@implementation ShippingInformationViewController

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
    [self setToInfo:[[NSDictionary alloc] init]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toTapped:(id)sender {
    if ([_toInfo count] == 0) {
        [self performSegueWithIdentifier:@"contactsSegue" sender:self];
    }
    else {
        //editing screen
    }
    //if blank:
        // offer to: fill with your info, address card info, or manually enter info
    //else:
        //pull up manual edit screen
}
@end

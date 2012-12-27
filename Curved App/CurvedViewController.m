//
//  CurvedViewController.m
//  Curved App
//
//  Created by Intern on 12/24/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import "CurvedViewController.h"

@interface CurvedViewController ()

@end

@implementation CurvedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"choosePanorama"]) {
        //        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSLog(@"self: %@", self);
        NSLog(@"destination: %@", [segue destinationViewController]);
        
    }
}

@end

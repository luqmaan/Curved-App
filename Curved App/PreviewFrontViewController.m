//
//  PreviewFrontViewController.m
//  Curved App
//
//  Created by Intern on 1/1/13.
//  Copyright (c) 2013 Createch. All rights reserved.
//

#import "PreviewFrontViewController.h"

@interface PreviewFrontViewController ()

@end

@implementation PreviewFrontViewController

@synthesize imageView, finalImage;

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [imageView setImage:finalImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

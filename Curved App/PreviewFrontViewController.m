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
//    self.imageView.image = finalImage;
//    NSLog(@"viewDidLoad");
//    NSLog(@"self: %@", self);
//    NSLog(@"imageView.image: %@", imageView.image);
//    NSLog(@"finalImage: %@", finalImage);
//    
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    NSLog(@"viewWillAppear");
//    NSLog(@"self: %@", self);
//    NSLog(@"imageView.image: %@", imageView.image);
//    NSLog(@"finalImage: %@", finalImage);
//    self.imageView.image = finalImage;
    [imageView setImage:finalImage];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setImageViewWithImage:(UIImage *)image
{
    NSLog(@"Updated the imagewview in the PreviewFrontViewController");
//    imageView.image = image;
    [imageView setImage:image];
    finalImage = image;
    NSLog(@"setImageViewWithImage: %@", image);
}
@end

//
//  MainMenuViewController.m
//  Curved App
//
//  Created by Charles Burgess on 12/28/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()


@end

@implementation MainMenuViewController

@synthesize croppedImage;

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
    self.imagePicker = [[GKImagePicker alloc] init];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startNewPanorama:(id)sender
{
    
    self.imagePicker.cropSize = CGSizeMake(320, 90);
    self.imagePicker.delegate = self;
    
    [self presentViewController:self.imagePicker.imagePickerController animated:YES completion:nil];
    
}
- (void)imagePicker:(GKImagePicker *)imagePicker pickedImage:(UIImage *)image
{
    [self setCroppedImage:image];
    [self dismissViewControllerAnimated:YES completion:^{
        [self performSegueWithIdentifier:@"editImage" sender:self];        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editImage"])
    {
        PanoramaFrameViewController *editViewController = [segue destinationViewController];
        [editViewController setCroppedImage:croppedImage];
    }
}
@end

//
//  PanoramaFrameViewController.m
//  Curved App
//
//  Created by Intern on 12/27/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import "PanoramaFrameViewController.h"

@interface PanoramaFrameViewController ()

@end

@implementation PanoramaFrameViewController

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
    NSLog(@"PanoramaFrameViewController didLoad");
    
    [self openImagePicker];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openImagePicker
{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    [imagePicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker
                       animated:YES
                     completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [[self imageView] setImage:image];
    }];
    
}

- (IBAction)changeFrameColor:(UISegmentedControl *)segment {

    NSLog(@"%d", segment.selectedSegmentIndex);
    
    UIColor *color = [[UIColor alloc] init];
    
    switch (segment.selectedSegmentIndex) {
        case 0:
            color = [UIColor whiteColor];
            break;
        case 1: default:
            color = [UIColor grayColor];
            break;
    }

    [[self view] setBackgroundColor:color];


}


@end

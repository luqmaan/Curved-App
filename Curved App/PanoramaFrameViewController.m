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
        
        
        [self displayEditorForImage:image];
        
    }];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^
    {
        [[self navigationController] popViewControllerAnimated:YES];
    }];
}

- (IBAction)changeFrameColor:(UISegmentedControl *)segment {

    NSLog(@"%d", segment.selectedSegmentIndex);
    
    UIColor *color = [[UIColor alloc] init];
    
    switch (segment.selectedSegmentIndex) {
        case 0: default:
            color = [UIColor clearColor];
            break;
        case 1:
            color = [UIColor blackColor];
            break;
        case 2:
            color = [UIColor whiteColor];
            break;
    }

    [[self view] setBackgroundColor:color];


}



- (void)displayEditorForImage:(UIImage *)imageToEdit
{
    
    NSArray *tools = [[NSArray alloc] initWithObjects:@"editor.tool.crop", nil];
    [AFPhotoEditorCustomization setOptionValue:tools forKey:@"editor.toolOrder"];
    
    [AFPhotoEditorCustomization setOptionValue:[UIColor redColor] forKey:@"editor.accentColor"];
    AFPhotoEditorController *editorController = [[AFPhotoEditorController alloc] initWithImage:imageToEdit];
    
    [editorController setDelegate:self];
    
    [self presentViewController:editorController animated:YES completion:nil];
}


- (void)photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[self imageView] setImage:image];
    // Handle the result image here
}

- (void)photoEditorCanceled:(AFPhotoEditorController *)editor
{
    [self dismissViewControllerAnimated:YES completion:^{
        [self openImagePicker];
    }];
    // Handle cancelation here
}

@end

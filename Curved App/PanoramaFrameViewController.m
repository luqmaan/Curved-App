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
        
        [self cropImage:image];
//        [self displayEditorForImage:image];
        
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


- (void)cropImage:(UIImage *)image {
    
    _imageCropper = [[NLImageCropperView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_imageCropper];
    [_imageCropper setImage:image];
    [_imageCropper setOriginX:100 setOriginY:500 setHeightRatio:4.625 setWidthRatio: 11.125];
}


- (void)displayEditorForImage:(UIImage *)imageToEdit
{
    
    /*  Set the options for the Aviary editor
        More info here: https://github.com/AviaryInc/Mobile-Feather-SDK-for-iOS/blob/master/AviarySDK/Headers/AFPhotoEditorCustomization.h
     */
    
    
    // misc settings
    NSArray *tools = [[NSArray alloc] initWithObjects: kAFCrop, kAFOrientation, kAFEnhance, kAFEffects, kAFBrightness, kAFContrast, nil];
    NSArray *orientation = [NSArray arrayWithObject:[NSNumber
                               numberWithUnsignedInt:UIInterfaceOrientationLandscapeLeft ]];
    
    // crop settings
    NSDictionary *panoSizePreset = [[NSDictionary alloc] initWithObjectsAndKeys:
                               [NSNumber numberWithFloat:1], kAFCropPresetHeight,
                               [NSNumber numberWithFloat:3.5], kAFCropPresetWidth,
                                    @"Panorama", kAFCropPresetName,
                               nil];
    
    NSArray *cropPresets = [[NSArray alloc] initWithObjects:panoSizePreset, nil];
    
    
    // misc colors
    UIColor *canvasColor = [UIColor whiteColor];
    UIColor *accentColor = [UIColor colorWithRed:0.506 green:0.733 blue:0.098 alpha:1];
    
    // navbar colors
    UIColor *navBarColor = [UIColor whiteColor];
    UIColor *navBarTextColor = [UIColor colorWithRed:0.220 green:0.220 blue:0.220 alpha:1];
    UIColor *navBarCancelColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1];
    UIColor *navBarCancelTextColor = [UIColor colorWithRed:0.220 green:0.220 blue:0.220 alpha:1];
    
    // footer colors
    UIColor *footerTextColor = [UIColor colorWithRed:0.502 green:0.502 blue:0.502 alpha:1];
    // UIColor *footerIconColor = [UIColor colorWithRed:0.506 green:0.733 blue:0.098 alpha:1];;
    UIColor *footerBackgroundColor = [UIColor whiteColor];
    
    // apply the settings
    [AFPhotoEditorCustomization setOptionValue:tools forKey:@"editor.toolOrder"];
    [AFPhotoEditorCustomization setOptionValue:orientation forKey:@"editor.supportedOrientations"];
    [AFPhotoEditorCustomization setOptionValue:cropPresets forKey:@"editor.tool.crop"];
    [AFPhotoEditorCustomization setOptionValue:canvasColor forKey:@"editor.canvasColor"];
    [AFPhotoEditorCustomization setOptionValue:accentColor forKey:@"editor.accentColor"];
    [AFPhotoEditorCustomization setOptionValue:navBarColor forKey:@"editor.navigationBarBackgroundColor"];
    [AFPhotoEditorCustomization setOptionValue:navBarTextColor forKey:@"editor.navigationBarTextColor"];
    [AFPhotoEditorCustomization setOptionValue:navBarCancelColor forKey:@"editor.navigationBarCancelColor"];
    [AFPhotoEditorCustomization setOptionValue:navBarCancelTextColor forKey:@"editor.navigationBarCancelTextColor"];
    [AFPhotoEditorCustomization setOptionValue:footerTextColor forKey:@"editor.bottomBarButtonTextColor"];
    [AFPhotoEditorCustomization setOptionValue:footerBackgroundColor forKey:@"editor.backgroundColor"];
    // [AFPhotoEditorCustomization setOptionValue:footerIconColor forKey:@"editor.bottomBarButtonIconColor"];
    [AFPhotoEditorCustomization setOptionValue:cropPresets forKey:@"editor.tool.crop.presets"];
    [AFPhotoEditorCustomization setOptionValue:[NSNumber numberWithBool:NO] forKey:@"editor.tool.crop.enableOriginal"];
    [AFPhotoEditorCustomization setOptionValue:[NSNumber numberWithBool:NO] forKey:@"editor.tool.crop.enableCustom"];
    
    // Open the editor
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

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

- (IBAction)pickimage:(id)sender {
}

- (IBAction)chooseImage:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    [picker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    [picker setDelegate:self];
    
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"oiwjefoiwejf");
        
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        NSLog(@"%g", image.size.height);
        
        [self displayEditorForImage:image];
        
        
    }];
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
    // Handle the result image here
}

- (void)photoEditorCanceled:(AFPhotoEditorController *)editor
{
    [self dismissViewControllerAnimated:YES completion:^{
        [self chooseImage:nil];
    }];
    // Handle cancelation here
}
@end

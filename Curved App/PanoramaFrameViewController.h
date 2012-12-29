//
//  PanoramaFrameViewController.h
//  Curved App
//
//  Created by Intern on 12/27/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFPhotoEditorController.h"

@interface PanoramaFrameViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, AFPhotoEditorControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)changeFrameColor:(id)sender;

// UIImagePicker
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

// Aviary
- (void)photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image;
- (void)photoEditorCanceled:(AFPhotoEditorController *)editor;

@end

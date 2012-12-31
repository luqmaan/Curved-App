//
//  PanoramaFrameViewController.h
//  Curved App
//
//  Created by Intern on 12/27/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFPhotoEditorController.h"

//#import "NLImageCropperView.h"

@interface ImagePickerViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, AFPhotoEditorControllerDelegate>

@property UIImage *originalImage;
@property UIImage *croppedImage;
@property UIImage *tweakedImage;

- (IBAction)tweakImage:(id)sender;

- (void)presentAviaryEditorWithImage:(UIImage *)imageToEdit;
- (void)presentImageCropperWithImage:(UIImage *)image;
- (void)presentimageCropperWithOriginalImage;

/* 
 * Delegates 
 */

// UIImagePicker
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

// Aviary
- (void)photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image;
- (void)photoEditorCanceled:(AFPhotoEditorController *)editor;

@end

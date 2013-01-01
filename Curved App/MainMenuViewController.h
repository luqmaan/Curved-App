//
//  MainMenuViewController.h
//  Curved App
//
//  Created by Charles Burgess on 12/28/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GKImagePicker.h>
#import "EditImageViewController.h"

@interface MainMenuViewController : UIViewController  <GKImagePickerDelegate>

@property GKImagePicker *imagePicker;
@property UIImage *croppedImage;

- (IBAction)startNewPanorama:(id)sender;

- (void)imagePicker:(GKImagePicker *)imagePicker pickedImage:(UIImage *)image;

@end

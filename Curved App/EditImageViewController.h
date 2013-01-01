//
//  EditImageViewController.h
//  Curved App
//
//  Created by Intern on 12/27/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFPhotoEditorController.h"
#import "PreviewFrontViewController.h"

@interface EditImageViewController : UIViewController <AFPhotoEditorControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) UIImage *croppedImage;
@property (weak, nonatomic) UIImage *editedImage;

- (IBAction)changeFrameColor:(id)sender;

- (void)presentPhotoEditorWithImage:(UIImage *)imageToEdit;

// Aviary
- (void)photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image;
- (void)photoEditorCanceled:(AFPhotoEditorController *)editor;

@end

//
//  CurvedViewController.h
//  Curved App
//
//  Created by Intern on 12/24/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFPhotoEditorController.h"

@interface CurvedViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, AFPhotoEditorControllerDelegate>

- (IBAction)chooseImage:(id)sender;

- (void)photoEditor:(AFPhotoEditorController *)editor finishedWithImage:(UIImage *)image;

- (void)photoEditorCanceled:(AFPhotoEditorController *)editor;

@end



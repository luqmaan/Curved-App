//
//  CurvedViewController.h
//  Curved App
//
//  Created by Intern on 12/24/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>

// @interface CurvedViewController : UINavigationController

@interface CurvedViewController: UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIImageView* imageView;
    UIButton* choosePhotoBtn;
    UIButton* takePhotoBtn;
}


    @property (nonatomic, retain) IBOutlet UIImageView* imageView;
    @property (nonatomic, retain) IBOutlet UIButton* choosePhotoBtn;
    @property (nonatomic, retain) IBOutlet UIButton* takePhotoBtn;

    - (IBAction) getPhoto:(id)sender;

@end

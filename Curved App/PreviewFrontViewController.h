//
//  PreviewFrontViewController.h
//  Curved App
//
//  Created by Intern on 1/1/13.
//  Copyright (c) 2013 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreviewFrontViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *finalImage;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

//
//  PreviewFrontViewController.h
//  Curved App
//
//  Created by Intern on 1/1/13.
//  Copyright (c) 2013 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreviewFrontViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) UIImage *finalImage;

- (void)setImageViewWithImage:(UIImage *)image;

@end

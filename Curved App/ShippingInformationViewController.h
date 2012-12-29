//
//  ShippingInformationViewController.h
//  Curved App
//
//  Created by Intern on 12/27/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShippingInformationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *messageTxt;
@property (weak, nonatomic) IBOutlet UIButton *toBtn;
@property (nonatomic, retain) NSDictionary *toInfo;

- (IBAction)toTapped:(id)sender;

@end

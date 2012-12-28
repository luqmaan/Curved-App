//
//  ShippingInformationViewController.h
//  Curved App
//
//  Created by Intern on 12/27/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShippingInformationViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *returnName;
@property (weak, nonatomic) IBOutlet UITextField *returnAddress1;
@property (weak, nonatomic) IBOutlet UITextField *returnAddress2;


@property (weak, nonatomic) IBOutlet UITextField *recipientName;
@property (weak, nonatomic) IBOutlet UITextField *recipientAddress1;
@property (weak, nonatomic) IBOutlet UITextField *recipientAddress2;


@end

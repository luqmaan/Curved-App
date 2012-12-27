//
//  CurvedViewController.m
//  Curved App
//
//  Created by Intern on 12/24/12.
//  Copyright (c) 2012 Createch. All rights reserved.
//

#import "CurvedViewController.h"


@implementation CurvedViewController

    @synthesize imageView, choosePhotoBtn, getStartedView, step1View;

    - (void)viewDidLoad
    {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
    }

    - (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

    - (IBAction) getPhoto:(id)sender {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];

        picker.delegate = self;
        
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        [self presentViewController:picker
                           animated:YES completion:nil];
        
    }

    - (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
        
        [picker dismissViewControllerAnimated:YES
                                   completion:nil];
        
        [self performSegueWithIdentifier:@"step1"
                                  sender:self];

        
        for (NSString *key in info) {
            NSLog(@"%@ -> %@", key, [info objectForKey:key]);
        }
        
        
        imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
    }



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"choosePanorama"]) {
        //        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSLog(@"self: %@", self);
        NSLog(@"destination: %@", [segue destinationViewController]);
        
    }
}

@end

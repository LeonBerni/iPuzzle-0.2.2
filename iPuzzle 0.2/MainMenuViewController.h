//
//  MainMenuViewController.h
//  iPuzzle 0.2
//
//  Created by Rodrigo P. Assunção on 4/2/15.
//  Copyright (c) 2015 LEONARDO LEGRADY SALGADO GIGLIOTTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDelegate.h"

@interface MainMenuViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnCamera;
@property (weak, nonatomic) IBOutlet UIButton *btnLib;
@property (weak, nonatomic) IBOutlet UIButton *btnAbout;
@property UIImage *imageToBeShuffled;
//@property (weak, nonatomic) IBOutlet UIImageView *ImageTaken;
@property (weak, nonatomic) IBOutlet UIButton *btnOK;

@end

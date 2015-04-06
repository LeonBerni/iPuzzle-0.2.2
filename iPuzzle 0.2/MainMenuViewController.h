//
//  MainMenuViewController.h
//  iPuzzle 0.2
//
//  Created by Rodrigo P. Assunção on 4/2/15.
//  Copyright (c) 2015 LEONARDO LEGRADY SALGADO GIGLIOTTI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnCamera;
@property (weak, nonatomic) IBOutlet UIButton *btnLib;
@property (weak, nonatomic) IBOutlet UIButton *btnAbout;
@property (weak, nonatomic) IBOutlet UIButton *btnDebug;
@property UIImage *imageToBeShuffled;
@property (weak, nonatomic) IBOutlet UIImageView *ImageTaken;

@end

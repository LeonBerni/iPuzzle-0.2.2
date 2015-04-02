//
//  RightSlidedown.m
//  aula gesture- custom gest
//
//  Created by ALESSANDRO CAMILLO GIMENEZ DE MENEZES on 12/02/14.
//  Copyright (c) 2014 ALESSANDRO CAMILLO GIMENEZ DE MENEZES. All rights reserved.
//

#import "SlideDesu.h"

@implementation SlideDesu

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    UITouch *touch = [touches anyObject];
    self.touchStart = [touch locationInView:self.view];
    if (self.touchStart.x < W/2) {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    if (touchLocation.x < W/2) {
        self.state = UIGestureRecognizerStateRecognized;
    }
}

@end

//
//  GESTURI.m
//  CORTA CARALHO
//
//  Created by LEON SALGUEIRO VALIENGO BERNI on 28/02/14.
//  Copyright (c) 2014 LEON SALGUEIRO VALIENGO BERNI. All rights reserved.
//

#import "GESTURI.h"

@implementation GESTURI

- (void)reset{
    [super reset];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    self.touchStart = [touch locationInView:self.view];
    self.fase = 0;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(touchLocation.x, touchLocation.y, W, H)];
    [imgView setImage:[UIImage imageNamed:@"url.jpg"]];
    [[self view] addSubview:imgView];
    [self setSucesso: FALSE];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    if (self.fase == 0) {
        if (touchLocation.x > self.touchStart.x+R || touchLocation.x < self.touchStart.x-R ) {
            self.state = UIGestureRecognizerStateFailed;
    }
    
        if (touchLocation.y > self.touchStart.y+((H/L)+R) || touchLocation.y < self.touchStart.y-R) {
            self.state = UIGestureRecognizerStateFailed;
    }
    
        if (touchLocation.y > self.touchStart.y+((H/L)-R) && touchLocation.y < self.touchStart.y+((H/L)+R)) {
            self.fase = 1;
    }
    }
    else if (self.fase == 1) {
        CGPoint secondPoint = self.touchStart;
        secondPoint.y = secondPoint.y+(H/L);
        
        if (touchLocation.y > secondPoint.y+R || touchLocation.y < secondPoint.y-R) {
            self.state = UIGestureRecognizerStateFailed;
        }
        if (touchLocation.x > secondPoint.x+((W/L)+R) || touchLocation.x < secondPoint.x-R ) {
            self.state = UIGestureRecognizerStateFailed;
        }
        if (touchLocation.x > secondPoint.x+((W/L)-R) && touchLocation.x < secondPoint.x+((W/L)+R)) {
            self.fase = 2;
        }
    }
    else if (self.fase == 2) {
        CGPoint thirdPoint = self.touchStart;
        thirdPoint.y = self.touchStart.y+(H/L);
        thirdPoint.x = self.touchStart.x+(W/L);
        
        if (touchLocation.x > thirdPoint.x+R || touchLocation.x < thirdPoint.x-R) {
            self.state = UIGestureRecognizerStateFailed;
        }
        if (touchLocation.y < thirdPoint.y-((H/L)+R) || touchLocation.y > thirdPoint.y+R ) {
            self.state = UIGestureRecognizerStateFailed;
        }
        if (touchLocation.y < thirdPoint.y-((H/L)-R) && touchLocation.y > thirdPoint.y-((H/L)+R)) {
            self.fase = 3;
        }

    }
    else {
        CGPoint fourthPoint = self.touchStart;
        fourthPoint.x = self.touchStart.x+(W/L);
        
        if (touchLocation.y > fourthPoint.y+R || fourthPoint.y < fourthPoint.y-R ) {
            self.state = UIGestureRecognizerStateFailed;
        }
        if (touchLocation.x < fourthPoint.x-((W/L)+R) || touchLocation.x > fourthPoint.x+R ) {
            self.state = UIGestureRecognizerStateFailed;
        }
        if (touchLocation.x < fourthPoint.x-((W/L)-R) && touchLocation.x > fourthPoint.x-((W/L)+R)){
            self.state = UIGestureRecognizerStateEnded;
            [self setSucesso: TRUE];
        }
    }
}

@end

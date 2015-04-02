//
//  GESTURI.h
//  CORTA CARALHO
//
//  Created by LEON SALGUEIRO VALIENGO BERNI on 28/02/14.
//  Copyright (c) 2014 LEON SALGUEIRO VALIENGO BERNI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "dados.h"

@interface GESTURI : UIGestureRecognizer
{
    NSMutableArray *points;
}

@property BOOL sucesso;
@property CGPoint touchStart;
@property int altura;
@property int base;
@property int fase;
@end

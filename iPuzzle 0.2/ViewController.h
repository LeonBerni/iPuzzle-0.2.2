//
//  ViewController.h
//  iPuzzle 0.2
//
//  Created by LEONARDO LEGRADY SALGADO GIGLIOTTI on 28/02/14.
//  Copyright (c) 2014 LEONARDO LEGRADY SALGADO GIGLIOTTI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Peca.h"
#import "Tabuleiro.h"
#import "GESTURI.h"
#import "SlideDesu.h"
#import "dados.h"

@interface ViewController : UIViewController {
    BOOL jogoAtivo;
    NSMutableArray *pecasController;
    Tabuleiro *meuTabuleiro;
    UIImageView *mihaImagem;
    UISwipeGestureRecognizer *meusSwipes[4];
    CGPoint pontoTocado;
    Peca *pecaTocada;
    GESTURI *gestureQuadrado;
    SlideDesu *slideSugoi;
    BOOL figuraUsada;
}

@property (weak, nonatomic) IBOutlet UILabel *labelFimJogo;

@end

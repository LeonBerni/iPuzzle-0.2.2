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
#import "dados.h"
#import "ImageDelegate.h"

@interface ViewController : UIViewController<ImageDelegate> {
    BOOL jogoAtivo;
    NSMutableArray *pecasController;
    Tabuleiro *meuTabuleiro;
    UIImageView *minhaImagem;
    UISwipeGestureRecognizer *meusSwipes[4];
    CGPoint pontoTocado;
    Peca *pecaTocada;
    BOOL figuraUsada;
}

@property (weak, nonatomic) IBOutlet UILabel *labelFimJogo;

@end

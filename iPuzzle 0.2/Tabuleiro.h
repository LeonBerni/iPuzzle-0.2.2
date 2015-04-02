//
//  Tabuleiro.h
//  iPuzzle 0.2
//
//  Created by LEONARDO LEGRADY SALGADO GIGLIOTTI on 28/02/14.
//  Copyright (c) 2014 LEONARDO LEGRADY SALGADO GIGLIOTTI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Peca.h"
#import "dados.h"

@interface Tabuleiro : NSObject


@property NSMutableArray *minhasPecas;
@property UIImageView *imagemUsada;


- (id) initWithImage : (UIImageView *) imagem;


@end

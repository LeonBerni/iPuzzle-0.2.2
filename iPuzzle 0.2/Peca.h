//
//  Peca.h
//  iPuzzle 0.2
//
//  Created by LEONARDO LEGRADY SALGADO GIGLIOTTI on 28/02/14.
//  Copyright (c) 2014 LEONARDO LEGRADY SALGADO GIGLIOTTI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Peca : NSObject

@property int posicaoX;
@property int posicaoY;
@property BOOL vazio;
@property UIImageView *imagemPeca;


- (id) initWithAll : (UIImageView *) imagem : (int) posX : (int) posY : (BOOL) existencia;


@end

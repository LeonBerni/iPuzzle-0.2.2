//
//  Peca.m
//  iPuzzle 0.2
//
//  Created by LEONARDO LEGRADY SALGADO GIGLIOTTI on 28/02/14.
//  Copyright (c) 2014 LEONARDO LEGRADY SALGADO GIGLIOTTI. All rights reserved.
//

#import "Peca.h"

@implementation Peca

- (id) initWithAll : (UIImageView *) imagem : (int) posX : (int) posY : (BOOL) existencia {
    self = [super init];
    [self setVazio: existencia];
    [self setPosicaoX: posX];
    [self setPosicaoY: posY];
    [self setImagemPeca: imagem];
    return self;
}

@end

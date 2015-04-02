//
//  Tabuleiro.m
//  iPuzzle 0.2
//
//  Created by LEONARDO LEGRADY SALGADO GIGLIOTTI on 28/02/14.
//  Copyright (c) 2014 LEONARDO LEGRADY SALGADO GIGLIOTTI. All rights reserved.
//

#import "Tabuleiro.h"

@implementation Tabuleiro


- (id) initWithImage : (UIImageView *) imagem {
    self = [super init];
    [self setImagemUsada: imagem];
    [self setMinhasPecas: [[NSMutableArray alloc] init]];
    [self cortaImagem];
    return self;
}


- (void) cortaImagem {
    for (int i = 0; i < L; i++) {
        [[self minhasPecas] addObject: [[NSMutableArray alloc] init]];
        for (int j = 0; j < L; j++) {
            if (i == L-1 && j == L-1) {
                CGRect size =  CGRectMake(X+(i*W/L), Y+(j*H/L), W/L, H/L);
                UIImageView *novaImageView = [[UIImageView alloc] init];
                [novaImageView setBackgroundColor: [UIColor whiteColor]];
                [novaImageView setFrame: CGRectMake (size.origin.x+1, size.origin.y+1, size.size.width-1, size.size.height-1)];
                [[[self minhasPecas] objectAtIndex:i] addObject: [[Peca alloc] initWithAll: novaImageView : i : j : FALSE]];
                break;
            }
            
            UIImage *melhorImagem = [[self imagemUsada] image];
            UIImage *imagemFinal = nil;
            
            CGSize perfectSize = CGSizeMake(W, H);
            UIGraphicsBeginImageContext(perfectSize);
            CGRect temp = CGRectMake(0, 0, 0, 0);
            temp.origin = CGPointMake(0.0, 0.0);
            temp.size.width = perfectSize.width;
            temp.size.height = perfectSize.height;
            
            [melhorImagem drawInRect: temp];
            
            imagemFinal = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            
            CGRect size =  CGRectMake(X+(i*W/L), Y+(j*H/L), W/L, H/L);
            CGImageRef tmp = CGImageCreateWithImageInRect(imagemFinal.CGImage, size);
            UIImage *imagemCortada = [UIImage imageWithCGImage: tmp];
            CGImageRelease(tmp);
            
            UIImageView *novaImageView = [[UIImageView alloc] initWithImage: imagemCortada];
            [novaImageView setFrame: CGRectMake (size.origin.x+1, size.origin.y+1, size.size.width-1, size.size.height-1)];
            [[[self minhasPecas] objectAtIndex:i] addObject: [[Peca alloc] initWithAll: novaImageView : i : j : TRUE]];
        }
    }
}
@end

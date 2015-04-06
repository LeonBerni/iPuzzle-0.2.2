
//
//  ViewController.m
//  iPuzzle 0.2
//
//  Created by LEONARDO LEGRADY SALGADO GIGLIOTTI on 28/02/14.
//  Copyright (c) 2014 LEONARDO LEGRADY SALGADO GIGLIOTTI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    figuraUsada = 0;
    [super viewDidLoad];
    [self iniciaSwipes];
    if (!minhaImagem) {
            minhaImagem = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"totoro2.jpg"]];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
    [minhaImagem setFrame: CGRectMake(0, 0, 256, 256)];
    } else{
    
    [minhaImagem setFrame: CGRectMake(0, 0, 512, 512)];
    }
    meuTabuleiro = [[Tabuleiro alloc] initWithImage: minhaImagem];
    [[self view] addSubview: minhaImagem];
    [minhaImagem setHidden:YES];
    jogoAtivo = TRUE;
    [self receberImagensTabuleiro];
    [[self labelFimJogo] setHidden: YES];
    [self randomizaLayout];
    
}


- (void) iniciaSwipes {
    meusSwipes[0] = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeFunction:)];
    [meusSwipes[0] setDirection: UISwipeGestureRecognizerDirectionUp];
    [[self view] addGestureRecognizer: meusSwipes[0]];
    meusSwipes[1] = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeFunction:)];
    [meusSwipes[1] setDirection: UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer: meusSwipes[1]];
    meusSwipes[2] = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeFunction:)];
    [meusSwipes[2] setDirection: UISwipeGestureRecognizerDirectionDown];
    [[self view] addGestureRecognizer: meusSwipes[2]];
    meusSwipes[3] = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeFunction:)];
    [meusSwipes[3] setDirection: UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer: meusSwipes[3]];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    pontoTocado = [touch locationInView: [self view]];
}


- (IBAction) swipeFunction:(id)sender {
    if (!jogoAtivo) {
        return;
    }
    [self checaPecaTocada];
    if (sender == meusSwipes[0] && pecaTocada.posicaoY > 0) {
        [self trocaPecas: pecaTocada.posicaoX : pecaTocada.posicaoY-1];
    } else if (sender == meusSwipes[1] && pecaTocada.posicaoX > 0) {
        [self trocaPecas: pecaTocada.posicaoX-1 : pecaTocada.posicaoY];
    } else if (sender == meusSwipes[2] && pecaTocada.posicaoY < L-1) {
        [self trocaPecas: pecaTocada.posicaoX : pecaTocada.posicaoY+1];
    } else if (sender == meusSwipes[3] && pecaTocada.posicaoX < L-1) {
        [self trocaPecas: pecaTocada.posicaoX+1 : pecaTocada.posicaoY];
    }
    
    if ([self checaFinalJogo]) {
        NSLog(@"FUKKKKKKK");
    }
}


- (IBAction) slideFunction:(id)sender {
    if (figuraUsada == 0) {
        minhaImagem.image = [UIImage imageNamed:@"totoro2.jpg"];
        figuraUsada = 1;
    } else {
        minhaImagem.image = [UIImage imageNamed:@"totoro.jpg"];
        figuraUsada = 0;
    }
    for (int i = 0; i < L; i++) {
        for (int j = 0; j < L; j++) {
            [[[[pecasController objectAtIndex:i] objectAtIndex:j] imagemPeca] setHidden:NO];
        }
    }
    [self iniciaSwipes];
    meuTabuleiro = [[Tabuleiro alloc] initWithImage: minhaImagem];
    [minhaImagem setHidden:YES];
    [self receberImagensTabuleiro];
    [[self labelFimJogo] setHidden: YES];
    jogoAtivo = TRUE;
    [self randomizaLayout];
}

//- (IBAction) quadradoFunction:(id)sender {
//    if (gestureQuadrado.sucesso) {
//        for (int i = 0; i < L; i++) {
//            for (int j = 0; j < L; j++) {
//                [[[[pecasController objectAtIndex:i] objectAtIndex:j] imagemPeca] setHidden:YES];
//            }
//        }
//        [minhaImagem setHidden:NO];
//    }
//    [gestureQuadrado setSucesso:FALSE];
//    [[self view] addGestureRecognizer: slideSugoi];
//    [[self view] removeGestureRecognizer: gestureQuadrado];
//}

- (void) receberImagensTabuleiro {
    for (int i = 0; i < L; i++) {
        for (int j = 0; j < L; j++) {
            Peca *temp = [[pecasController objectAtIndex:i] objectAtIndex:j];
            [temp.imagemPeca removeFromSuperview];
        }
    }
    pecasController = [meuTabuleiro minhasPecas];
    for (int i = 0; i < L; i++) {
        for (int j = 0; j < L; j++) {
            Peca *temp = [[pecasController objectAtIndex:i] objectAtIndex:j];
            [[self view] addSubview: temp.imagemPeca];
            if (temp.vazio) {
                [temp.imagemPeca.layer setZPosition: L+1];
            }
        }
    }
    
}

- (void) checaPecaTocada {
    for (int i = 0; i < L; i++) {
        for (int j = 0; j < L; j++) {
            Peca *temp = [[pecasController objectAtIndex:i] objectAtIndex:j];
            if (pontoTocado.x > temp.imagemPeca.frame.origin.x &&
                pontoTocado.y > temp.imagemPeca.frame.origin.y &&
                pontoTocado.x < temp.imagemPeca.frame.origin.x+temp.imagemPeca.frame.size.width &&
                pontoTocado.y < temp.imagemPeca.frame.origin.y+temp.imagemPeca.frame.size.height) {
                pecaTocada = [[pecasController objectAtIndex:i] objectAtIndex:j];
                break;
            }
        }
        if (pecaTocada != nil) {
            break;
        }
    }
}


- (void) randomizaLayout {
    for (int i = 0; i < 100; i++) {
        int w = L-1, x = L-1, y = L-1, z = L-1;
        while (w == L-1 && x == L-1) {
            w = arc4random()%L;
            x = arc4random()%L;
        }
        Peca *temp1 = [[pecasController objectAtIndex:w] objectAtIndex:x];
        
        while (y == L-1 && z == L-1) {
            y = arc4random()%L;
            z = arc4random()%L;
        }
        Peca *temp2 = [[pecasController objectAtIndex:y] objectAtIndex:z];
        
        int tempPosY = temp1.posicaoY;
        int tempPosX = temp1.posicaoX;
        CGRect temp = temp1.imagemPeca.frame;
        
        temp1.posicaoY = temp2.posicaoY;
        temp2.posicaoY = tempPosY;
        temp1.posicaoX = temp2.posicaoX;
        temp2.posicaoX = tempPosX;
        
        temp1.imagemPeca.frame = temp2.imagemPeca.frame;
        temp2.imagemPeca.frame = temp;
    }
}


- (void) trocaPecas : (int) x : (int) y {
    for (int i = 0; i < L; i++) {
        for (int j = 0; j < L; j++) {
            if ([[[pecasController objectAtIndex:i] objectAtIndex:j] posicaoX] == x && [[[pecasController objectAtIndex:i] objectAtIndex:j] posicaoY] == y) {
                Peca *destino = [[pecasController objectAtIndex:i] objectAtIndex:j];
                if (!destino.vazio) {
                    int tempPosY = destino.posicaoY;
                    int tempPosX = destino.posicaoX;
                    CGRect temp = destino.imagemPeca.frame;
                    
                    destino.posicaoY = pecaTocada.posicaoY;
                    pecaTocada.posicaoY = tempPosY;
                    destino.posicaoX = pecaTocada.posicaoX;
                    pecaTocada.posicaoX = tempPosX;
                    
                    destino.imagemPeca.frame = pecaTocada.imagemPeca.frame;
                    [UIView animateWithDuration:0.25 animations:^ {
                        pecaTocada.imagemPeca.frame = temp;
                    }];
                    
                    pecaTocada = nil;
                    return;
                }
            }
        }
    }
    pecaTocada = nil;
}


- (BOOL) checaFinalJogo {
    for (int i = 0; i < L; i++) {
        for (int j = 0; j < L; j++) {
            if ([[[pecasController objectAtIndex:i] objectAtIndex:j] posicaoX] != i || [[[pecasController objectAtIndex:i] objectAtIndex:j] posicaoY] != j) {
                return FALSE;
            }
        }
    }
    jogoAtivo = FALSE;
    [[self labelFimJogo] setHidden: NO];
    [[self view] removeGestureRecognizer:meusSwipes[0]];
    [[self view] removeGestureRecognizer:meusSwipes[1]];
    [[self view] removeGestureRecognizer:meusSwipes[2]];
    [[self view] removeGestureRecognizer:meusSwipes[3]];
    return TRUE;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setImage:(UIImage *)image{
    minhaImagem = [[UIImageView alloc] initWithImage: image];
}

@end

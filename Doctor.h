//
//  Doctor.h
//  TareaUltima
//
//  Created by Adriana  Cambronero on 8/21/15.
//  Copyright (c) 2015 cenfotec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Doctor : NSObject

@property(nonatomic,strong)NSString* nombre;
@property(nonatomic,strong)NSString* inscripcion;
@property(nonatomic,strong)NSString* especialidad;
@property(nonatomic,strong)NSString* universidad;
@property(nonatomic,strong)NSString* correo;
@property(nonatomic,strong)UIImage* docImage;
@end

//
//  RegisterViewController.h
//  RegistroParse
//
//  Created by Cesar Brenes on 4/18/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextFieldLimit.h"

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nombreTextField;


@property (weak, nonatomic) IBOutlet UITextField *cedulaTextField;
@property (weak, nonatomic) IBOutlet UITextField *correoTextField;
@property (weak, nonatomic) IBOutlet UITextField *empresaTextField;
@property (weak, nonatomic) IBOutlet UITextField *sangreTextField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedController;


@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loadSegmented:(id)sender;

@property(weak,nonatomic)NSString* sexoNombre;

@end

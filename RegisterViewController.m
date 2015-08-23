//
//  RegisterViewController.m
//  RegistroParse
//
//  Created by Cesar Brenes on 4/18/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.correoTextField setLimit:50];
    [self initialize];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initialize{
    UIBarButtonItem *add =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(registerWithParse)];
    NSMutableArray* barArray =[NSMutableArray new];
    [barArray addObject:add];
    self.navigationItem.rightBarButtonItems = barArray;
}



/*
-(void)doRegistration{
    BOOL passwordAreEqual = [self.password2TexField.text isEqualToString:self.passwordTextField.text];
    BOOL textFieldDontHaveSpacesInWhite = [self validateAllSpacesInWhiteInTextFields];
    if (passwordAreEqual && textFieldDontHaveSpacesInWhite) {
//        LISTO PARA TRABAJAR CON PARSE
        [self registerWithParse];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Verifique los campos ingresados" delegate:nil cancelButtonTitle:@"Aceptae" otherButtonTitles:nil, nil]
        ;
        [alert show];
    }
}*/


-(void)registerWithParse{
    PFUser *user = [PFUser user];
    user.username = self.nombreTextField.text;
    user.password = self.passwordTextField.text;
    user.email = self.correoTextField.text;
    user[@"username"] = self.nombreTextField.text;
    user[@"blood"] = self.sangreTextField.text;
    user[@"id"] = self.cedulaTextField.text;
    user[@"company"] = self.empresaTextField.text;
    user[@"Gender"] = self.sexoNombre;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                [self.navigationController popViewControllerAnimated:YES];
            }else {
                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Check that you mail exist" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
                [errorAlertView show];
            }
    }];
}

//FUNCION PARA VALIDAR ESPACIOS EN BLANCO
-(BOOL)validateWhiteSpaces:(NSString*)textToEvaluate{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [textToEvaluate stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] == 0) {
        // Text was empty or only whitespace.
        return NO;
    }
    else{
        return YES;
    }
}
-(BOOL)validateAllSpacesInWhiteInTextFields{
    BOOL nameValidation = [self validateWhiteSpaces:self.nombreTextField.text];
    BOOL emailValidation = [self validateWhiteSpaces:self.correoTextField.text];
    BOOL password1 = [self validateWhiteSpaces:self.passwordTextField.text];
    BOOL cedula = [self validateWhiteSpaces:self.cedulaTextField.text];
    BOOL empresa = [self validateWhiteSpaces:self.empresaTextField.text];
    BOOL sangre = [self validateWhiteSpaces:self.sangreTextField.text];
      if (nameValidation && emailValidation && password1 && cedula && empresa && sangre) {
        return YES;
    }
    else{
        return NO;
    }
    
}




- (IBAction)loadSegmented:(id)sender {
    if (self.segmentedController.selectedSegmentIndex ==0) {
        self.sexoNombre =@"Femenino";
    }else{
        self.sexoNombre =@"Masculino";
    }
    
}
@end

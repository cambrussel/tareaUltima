//
//  LoginViewController.m
//  RegistroParse
//
//  Created by Cesar Brenes on 4/18/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//


#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "TabBarViewController.h"
#import <Parse/Parse.h>

#import "ForgotPasswordViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    [PFUser logInWithUsernameInBackground:self.emailTextfield.text password:self.passwordTextfield.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            if(![[user objectForKey:@"emailVerified"]boolValue]==TRUE){
                                                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Verificar su correo" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
                                                [errorAlertView show];
                                                
                                            }else{
                                                TabBarViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarViewController"];
                                                [self.navigationController pushViewController:newView animated:YES];
                                            }
                                            
                                            
                                        } else {
                                            
                                            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Usuario o contraseña incorrecta" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
                                            [errorAlertView show];
                                            
                                            // The login failed. Check error to see why.
                                        }
                                    }];

    
}

- (IBAction)SignInAction:(id)sender {
    RegisterViewController *registerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"registerViewController"];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

- (IBAction)forgotPasswordAction:(id)sender{
    
    ForgotPasswordViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"ForgotPasswordViewController"];
    [self.navigationController pushViewController:newView animated:YES];
}

- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}
@end

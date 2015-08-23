//
//  ForgotPasswordViewController.m
//  RegistroParse
//
//  Created by Cesar Brenes on 4/18/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import <Parse/Parse.h>

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)doneButton:(id)sender{
    [PFUser requestPasswordResetForEmailInBackground:self.emailTextField.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end

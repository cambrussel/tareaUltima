//
//  LoginViewController.h
//  RegistroParse
//
//  Created by Cesar Brenes on 4/18/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
- (IBAction)loginAction:(id)sender;
- (IBAction)SignInAction:(id)sender;
- (IBAction)forgotPasswordAction:(id)sender;
@end

//
//  ForgotPasswordViewController.h
//  RegistroParse
//
//  Created by Cesar Brenes on 4/18/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
- (IBAction)doneButton:(id)sender;

@end

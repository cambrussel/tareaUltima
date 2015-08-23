//
//  DocInfoViewController.h
//  TareaUltima
//
//  Created by Adriana  Cambronero on 8/21/15.
//  Copyright (c) 2015 cenfotec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "Doctor.h"

@interface DocInfoViewController : UIViewController<MFMessageComposeViewControllerDelegate>

@property (strong, nonatomic)MFMailComposeViewController *mailer;
@property (weak, nonatomic) IBOutlet UIImageView *docImage;
@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UILabel *inscripcion;
@property (weak, nonatomic) IBOutlet UILabel *especialidad;
@property (weak, nonatomic) IBOutlet UILabel *universidad;
@property (weak, nonatomic) IBOutlet UILabel *correo;
- (IBAction)contactar:(id)sender;

@property(nonatomic,strong) Doctor* myDoc;

@end

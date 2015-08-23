//
//  DocInfoViewController.m
//  TareaUltima
//
//  Created by Adriana  Cambronero on 8/21/15.
//  Copyright (c) 2015 cenfotec. All rights reserved.
//

#import "DocInfoViewController.h"

@interface DocInfoViewController ()

@end

@implementation DocInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
}

-(void)initialize{
    self.nombre.text = self.myDoc.nombre;
    self.inscripcion.text =self.myDoc.inscripcion;
    self.especialidad.text = self.myDoc.especialidad;
    self.universidad.text = self.myDoc.universidad;
    self.correo.text = self.myDoc.correo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)contactar:(id)sender {
    self.mailer = [[MFMailComposeViewController alloc] init];
    self.mailer.mailComposeDelegate = self;
    
    [self.mailer setSubject:@"Hospital Vida Plena"];
    
    NSArray *toRecipients = [NSArray arrayWithObjects:self.myDoc.correo, nil];
    [self.mailer setToRecipients:toRecipients];

    NSString *emailBody = @"";
    [self.mailer setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:self.mailer animated:YES completion:nil];
    
}
@end

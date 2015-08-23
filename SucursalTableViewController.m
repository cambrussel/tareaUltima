//
//  SucursalTableViewController.m
//  TareaUltima
//
//  Created by Adriana  Cambronero on 8/21/15.
//  Copyright (c) 2015 cenfotec. All rights reserved.
//

#import "SucursalTableViewController.h"
#import "Sucursal.h"
#import "CustomCategoryDosTableView.h"
#import <Parse/Parse.h>


static int NUMBER_SECTION =1;
static NSString* CELL_IDENTIFIER =@"CustomCategoryDosTableView";

@interface SucursalTableViewController ()

@end

@implementation SucursalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:CELL_IDENTIFIER bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_IDENTIFIER];
    self.suc = [NSMutableArray new];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Sucursal"];
    [query selectKeys:@[@"nombre",@"fotografia",@"ubicacion",@"telefono"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if(objects){
            for(PFObject* current in objects){
                Sucursal* myDoc = [Sucursal new];
                
                NSString* nombre = [current valueForKey:@"nombre"];
                NSString* ubicacion = [current valueForKey:@"ubicacion"];
                NSString* telefono = [current valueForKey:@"telefono"];
                UIImage* docImage =[current valueForKey:@"fotografia"];
                
                myDoc.nombre = nombre;
                myDoc.telefono = telefono;
                myDoc.ubicacion = ubicacion;
                myDoc.sucImage = docImage;
                [self.suc addObject:myDoc];
                
            }
            NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nombre" ascending:NO];
            [self.suc sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
            
            [self.tableView reloadData];
            
            
        }else{
            NSLog(@"Error: %@", error);
        }
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return NUMBER_SECTION;
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.suc count];
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCategoryDosTableView *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    Sucursal* object = [self.suc objectAtIndex:indexPath.row];
    
    cell.imageLabel.image = object.sucImage;
    
    cell.nombreLabel.text = object.nombre;
    cell.ubicacionLabel.text = object.ubicacion;
    cell.telefonoLabel.text = object.telefono;
    
    
    return cell;
    
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Sucursal* selectedObject = [self.suc objectAtIndex:indexPath.row];
    self.telefono = selectedObject.telefono;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"desea realizar una llamada teléfonica a dicha sucursal?" message:[NSString stringWithFormat:@""] delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Llamar",nil];
    [alert show];

    }


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
    {
        NSLog(@"cancel");
    }
    if (buttonIndex == 1)
    {
        NSLog(@"aceptar");
        
        NSString *phoneNumber = [@"telprompt://" stringByAppendingString:self.telefono];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    }
}


@end

//
//  DoctorViewController.m
//  TareaUltima
//
//  Created by Adriana  Cambronero on 8/21/15.

//  Copyright (c) 2015 cenfotec. All rights reserved.

#import "DoctorTableViewController.h"
#import "CustomCategoryTableView.h"
#import "DocInfoViewController.h"
#import "Doctor.h"
#import <Parse/Parse.h>



static int NUMBER_SECTION =1;
static NSString* CELL_IDENTIFIER =@"CustomCategoryTableView";

@interface DoctorTableViewController ()

@end


@implementation DoctorTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:CELL_IDENTIFIER bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CELL_IDENTIFIER];
    self.doc = [NSMutableArray new];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Doctor"];
    [query selectKeys:@[@"nombre",@"fotografia",@"inscripcion",@"especialidad",@"universidad",@"correo"]];
    //[query whereKey:@"category" equalTo:self.category.name];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if(objects){
            for(PFObject* current in objects){
                Doctor* myDoc = [Doctor new];
                
                NSString* nombre = [current valueForKey:@"nombre"];
                NSString* inscripcion = [current valueForKey:@"inscripcion"];
                NSString* especialidad = [current valueForKey:@"especialidad"];
                NSString* universidad =[current valueForKey:@"universidad"];
                NSString* correo =[current valueForKey:@"correo"];
                UIImage* docImage =[current valueForKey:@"fotografia"];
                
                myDoc.nombre = nombre;
                myDoc.inscripcion = inscripcion;
                myDoc.especialidad = especialidad;
                myDoc.universidad = universidad;
                myDoc.correo = correo;
                myDoc.docImage = docImage;
                [self.doc addObject:myDoc];
                
            }
            NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nombre" ascending:NO];
            [self.doc sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
            
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
 
     return [self.doc count];
 
 }
 
 


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCategoryTableView *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    Doctor* object = [self.doc objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%d",(int)indexPath.row+1];
    
    cell.nameLabel.text = object.nombre;
    //cell.imageDoc.image. = [[UIImage alloc] initWithData:object.docImage];
  
    
    return cell;
    
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Doctor* selectedObject = [self.doc objectAtIndex:indexPath.row];
    
    DocInfoViewController* detailView =[self.storyboard instantiateViewControllerWithIdentifier:@"docInfoViewController"];
    detailView.myDoc = selectedObject;
    [self.navigationController pushViewController:detailView animated:YES];
}






@end


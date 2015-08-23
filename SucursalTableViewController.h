//
//  SucursalTableViewController.h
//  TareaUltima
//
//  Created by Adriana  Cambronero on 8/21/15.
//  Copyright (c) 2015 cenfotec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SucursalTableViewController : UITableViewController<UIAlertViewDelegate>

@property(nonatomic,strong) NSMutableArray* suc;
@property(nonatomic,strong)NSString* telefono;
@end

//
//  InicioPaginaViewController.h
//  Todo
//
//  Created by Isaias Moraga on 2/10/14.
//  Copyright (c) 2014 Isaias Moraga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InicioPaginaViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>


@property (strong, nonatomic) IBOutlet UITextField *rut;
@property (strong, nonatomic) IBOutlet UITextField *clave;
@property (strong, nonatomic) IBOutlet NSMutableArray *values;
@property (strong, nonatomic) IBOutlet NSMutableArray *keys;
@property (strong, nonatomic) IBOutlet NSDictionary *credential;
- (IBAction)Aceptar:(id)sender;

@end

//
//  InicioIpadViewController.h
//  SearchME
//
//  Created by Isaias Moraga on 2/17/14.
//  Copyright (c) 2014 Isaias Moraga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InicioIpadViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) UIButton *menuBtn;
@property (strong, nonatomic) IBOutlet UITextField *rut;
@property (strong, nonatomic) IBOutlet UITextField *clave;
@property (strong, nonatomic) IBOutlet NSMutableArray *values;
@property (strong, nonatomic) IBOutlet NSMutableArray *keys;
@property (strong, nonatomic) IBOutlet NSDictionary *credential;


@property (weak, nonatomic) IBOutlet UITextView *textWelcome;
@property (weak, nonatomic) IBOutlet UILabel *textRut;
@property (weak, nonatomic) IBOutlet UILabel *textClave;
@property (weak, nonatomic) IBOutlet UIButton *textAceptar;
@property (weak, nonatomic) IBOutlet UILabel *textAbreTuCuenta;





- (IBAction)Aceptar:(id)sender;

@end

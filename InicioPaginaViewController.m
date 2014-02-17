//
//  InicioPaginaViewController.m
//  Todo
//
//  Created by Isaias Moraga on 2/10/14.
//  Copyright (c) 2014 Isaias Moraga. All rights reserved.
//

#import "InicioPaginaViewController.h"

@interface InicioPaginaViewController ()

@end

@implementation InicioPaginaViewController
@synthesize rut = _rut;
@synthesize clave = _clave;
@synthesize values = _values;
@synthesize keys = _key;
@synthesize credential = _credential;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    _rut.delegate = self;
    _clave.delegate = self;

    NSMutableArray *pru = [NSMutableArray arrayWithObjects:@"180879684", @"180879686", @"180879687", @"180879688", @"180879689", nil];
    _key = pru;
    
    NSMutableArray *pru2 = [NSMutableArray arrayWithObjects:@"4", @"5", @"6", @"7", @"8", nil];
    _values = pru2;
    NSDictionary *persona = [NSDictionary dictionaryWithObjects:_values forKeys:_key];
    _credential = persona;
    
   // NSLog(@"%@", _key);
	// Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_rut resignFirstResponder];
    [_clave resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Aceptar:(id)sender {
    UIAlertView *alerta = [[UIAlertView alloc] init];
    UIAlertView *bienvenido = [[UIAlertView alloc] init];
    [alerta setDelegate:self];
    [alerta setTitle:@"ERROR!"];
    [alerta setMessage:@"Credencial de usuario correcta"];
    [alerta addButtonWithTitle:@"Aceptar"];
    [alerta addButtonWithTitle:@"cancelar"];
    [bienvenido setTitle:@"Bienvenido!!!"];
    [bienvenido setMessage:@"Te invitamos a disfrutar de nuestras Novedades"];
    [bienvenido addButtonWithTitle:@"Aceptar"];
    
    
    
    NSString *auxiliar = [[NSString alloc] init];
    NSString *auxiliar2 = [[NSString alloc] init];
    auxiliar = _rut.text;
    NSLog(@"%@",[_credential objectForKey:auxiliar]);
    auxiliar2 = [_credential objectForKey:auxiliar];
    //NSLog(@"%@",_rut.text);
    NSLog(@"%@",auxiliar2);
    
    if ([auxiliar2 isEqualToString:_clave.text]) {
        [bienvenido show];
    }
    else{
        [alerta setMessage:@"Credencial de usuario Incorrecta"];
        [alerta show];
    }
    //[alerta show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        _rut.text = @"";
        _clave.text = @"";
    }
}
@end

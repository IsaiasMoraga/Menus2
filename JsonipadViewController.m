//
//  JsonipadViewController.m
//  SearchME
//
//  Created by Isaias Moraga on 2/16/14.
//  Copyright (c) 2014 Isaias Moraga. All rights reserved.
//

#import "JsonipadViewController.h"
#import "DetailViewController.h"
#import "SBJson.h"
#import "SBJsonParser.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
@interface JsonipadViewController ()

@end

@implementation JsonipadViewController
@synthesize menuBtn;
- (NSMutableArray *)Keys
{
    if (!_objets) {
        _objets = [[NSMutableArray alloc] init];
    }
    return _objets;
}
- (NSMutableArray *)objets
{
    if (!_objets) {
        _objets = [[NSMutableArray alloc] init];
    }
    return _objets;
}
- (NSMutableArray *)result
{
    if (!_result) {
        _result = [[NSMutableArray alloc] init];
    }
    return _result;
}
- (NSDictionary *)resultados
{
    if (!_resultados) {
        _resultados = [[NSDictionary alloc] init];
    }
    return _resultados;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    self.menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(8, 10, 34, 24);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.menuBtn];
    
    //  NSDictionary *dic1 = [[NSDictionary alloc] initWithObjects:_objets forKeys:_Keys];
    // NSLog(@"%@", dic1);
    
    
    NSURL *url = [NSURL URLWithString:@"https://etrader.corpbancainversiones.cl/api/1.0/stocks"];
    NSData *datos = [[NSData alloc] initWithContentsOfURL:url];
    NSError *error = nil;
    NSString *datos_string = [[NSString alloc] initWithData:datos encoding:NSUTF8StringEncoding];
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    
    NSDictionary *json = [parser objectWithString:datos_string error:&error];
    lectura = json;
    for (NSDictionary *dic in lectura) {
        [self.objets addObject:[dic objectForKey:@"name"]];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchthroughData
{
    self.result = nil;
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains [search] %@", self.searchBar.text];
    self.result = [[self.objets filteredArrayUsingPredicate:resultPredicate] mutableCopy];
    //self.resultados = [[lectura filteredArrayUsingPredicate:resultPredicate] mutableCopy];
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self searchthroughData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        return self.objets.count;
    }else{
        [self searchthroughData];
        return self.result.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.layer.backgroundColor = [UIColor blueColor].CGColor;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
         cell.layer.backgroundColor = [UIColor blueColor].CGColor;
        
    }
    
    if (tableView == self.tableView) {
        cell.textLabel.text = self.objets[indexPath.row];
         cell.layer.backgroundColor = [UIColor blueColor].CGColor;
    }
    else
    {
        cell.textLabel.text = self.result[indexPath.row];
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  if (self.searchDisplayController.isActive) {
    //      [self performSegueWithIdentifier:@"ShowDetail" sender:self];
    //  }
    
}
/*
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if ([[segue identifier] isEqualToString:@"ShowDetail"]) {
 NSString *name = nil;
 NSIndexPath *indexPath = nil;
 
 if (self.searchDisplayController.isActive) {
 indexPath = [[self.searchDisplayController searchResultsTableView] indexPathsForSelectedRows];
 name = self.result[indexPath.row];
 }else{
 indexPath = [self.tableView indexPathForSelectedRow];
 name = self.objets[indexPath.row];
 //  country = [ValuesDictionary objectForKey:@"country"];
 //  ticker = [ValuesDictionary objectForKey:@"ticker"];
 }
 
 //[[segue destinationViewController] setDetailLabelContents:country];
 //[[segue destinationViewController] setTickerLabelContents:ticker];
 
 [[segue destinationViewController] setNameLabelContents:name];
 
 }
 
 }
 */
- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}
@end
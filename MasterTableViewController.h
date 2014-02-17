//
//  MasterTableViewController.h
//  SearchME
//
//  Created by Isaias Moraga on 2/14/14.
//  Copyright (c) 2014 Isaias Moraga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterTableViewController : UITableViewController < UISearchBarDelegate >
{
    NSMutableArray *lectura;
}
@property (nonatomic, strong) NSMutableArray *Keys;
@property (nonatomic, strong) NSMutableArray *objets;
@property (nonatomic, strong) NSMutableArray *result;
@property (nonatomic, strong) NSDictionary *resultados;

@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;


@end

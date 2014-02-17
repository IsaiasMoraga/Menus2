//
//  JsonipadViewController.h
//  SearchME
//
//  Created by Isaias Moraga on 2/16/14.
//  Copyright (c) 2014 Isaias Moraga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JsonipadViewController : UITableViewController < UISearchBarDelegate >
{
    NSMutableArray *lectura;
}
@property (nonatomic, strong) NSMutableArray *Keys;
@property (nonatomic, strong) NSMutableArray *objets;
@property (nonatomic, strong) NSMutableArray *result;
@property (nonatomic, strong) NSDictionary *resultados;
@property (strong, nonatomic) UIButton *menuBtn;
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;


@end



//
//  DetailViewController.h
//  SearchME
//
//  Created by Isaias Moraga on 2/14/14.
//  Copyright (c) 2014 Isaias Moraga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) NSString *detailLabelContents;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) NSString *nameLabelContents;


@property (weak, nonatomic) IBOutlet UILabel *tickerLabel;
@property (strong, nonatomic) NSString *tickerLabelContents;

@end

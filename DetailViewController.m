//
//  DetailViewController.m
//  SearchME
//
//  Created by Isaias Moraga on 2/14/14.
//  Copyright (c) 2014 Isaias Moraga. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	self.detailLabel.text = self.detailLabelContents;
    self.nameLabel.text = self.nameLabelContents;
    self.tickerLabel.text = self.tickerLabelContents;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

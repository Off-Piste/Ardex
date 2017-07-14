//
//  ADXViewController.m
//  Ardex
//
//  Created by harrytwright on 07/12/2017.
//  Copyright (c) 2017 harrytwright. All rights reserved.
//

#import "ADXViewController.h"

@interface ADXViewController ()

@end

@implementation ADXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasource = [[ADXDatasource alloc] initWithCollectionView:self.collectionView];
    (self.datasource).objects = @[@"Hello", @"World"];
}

@end

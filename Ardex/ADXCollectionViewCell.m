//
//  ADXCollectionViewCell.m
//  Ardex
//
//  Created by Harry Wright on 12.07.17.
//  Copyright © 2017 Trolley. All rights reserved.
//

#import "ADXCollectionViewCell.h"

@implementation ADXCollectionViewCell

+ (NSString *)reuseID {
    return @"Cell";
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self->_reuseID = [ADXCollectionViewCell reuseID];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
//        self->_reuseID = [ADXCollectionViewCell reuseID];
    }
    
    return self;
}

- (void)setDatasourceItem:(id)datasourceItem {
    if (datasourceItem == nil) {
        return;
    }
    
    self->_datasourceItem = datasourceItem;
    
    [self setupViews];
    [self configureCell];
}

- (void)setupViews { }

- (void)configureCell { }

@end

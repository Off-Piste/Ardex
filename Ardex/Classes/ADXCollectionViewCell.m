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

- (NSString *)reuseID {
    return [ADXCollectionViewCell reuseID];
}

- (void)setDatasourceItem:(id)datasourceItem {
    if (datasourceItem == nil) {
        return;
    }
    
    self->_datasourceItem = datasourceItem;
    
    [self setupViews];
    [self configureCell];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    return self;
}

- (void)setupViews { }

- (void)configureCell { }

@end

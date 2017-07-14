//
//  ADXTableViewCell.m
//  Pods
//
//  Created by Harry Wright on 14.07.17.
//
//

#import "ADXTableViewCell.h"

@implementation ADXTableViewCell

- (void)setDatasourceItem:(id)datasourceItem {
    if (!datasourceItem) {
        return;
    }
    
    self->_datasourceItem = datasourceItem;
    
    [self setupViews];
    [self configureCell];
}

+ (NSString *)reuseID {
    return @"Cell";
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (void)configureCell { }

- (void)setupViews { }

@end

//
//  ADXTableViewCell.m
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import "ADXTableViewCell.h"

@implementation ADXTableViewCell

- (id)datasourceItem {
    return _object;
}

- (void)setDatasourceItem:(id)datasourceItem {
    _object = datasourceItem ? datasourceItem : [NSNull null];
    [self configureCell];
}

+ (NSString *)reuseID {
    NSString *cls = NSStringFromClass(self);
    return [cls componentsSeparatedByString:@"."].lastObject;
}

- (instancetype)init {
    if (self = [super init]) {
        [self lifeCycle];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self lifeCycle];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self lifeCycle];
    }
    return self;
}

- (void)lifeCycle {
    [self setupViews];
}

- (void)setupViews { }

- (void)configureCell { }

@end

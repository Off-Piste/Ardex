//
//  ADXCollectionViewCell.m
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import "ADXCollectionViewCell.h"

@implementation ADXCollectionViewCell

- (id)datasourceItem {
    return _object;
}

- (void)setDatasourceItem:(id)datasourceItem {
    ADXLog(@"");
    _object = datasourceItem;
    [self configureCell];
}

+ (NSString *)reuseID {
    NSString *cls = NSStringFromClass(self);
    return [cls componentsSeparatedByString:@"."].lastObject;
}

- (instancetype)init {
    if (self = [super init]) {
        ADXLog(@"");
        [self lifeCycle];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        ADXLog(@"");
        [self lifeCycle];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        ADXLog(@"");
        [self lifeCycle];
    }
    return self;
}

- (void)lifeCycle {
    [self setupViews];
}

- (void)setupViews { ADXLog(@""); }

- (void)configureCell { ADXLog(@""); }

@end

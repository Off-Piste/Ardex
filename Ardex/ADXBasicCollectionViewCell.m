//
//  ADXBasicCollectionViewCell.m
//  Ardex
//
//  Created by Harry Wright on 11.10.17.
//

#import "ADXBasicCollectionViewCell.h"
#import "ADXAssert.h"

inline static CGRect cg_rect_make_from_cell(CGRect rect) {
    return CGRectMake(16, 0, rect.size.width, rect.size.height);
}

@implementation ADXBasicCollectionViewCell

- (void)configureCell {
    [super configureCell];

    CGRect rect = cg_rect_make_from_cell(self.bounds);
    NSString *msg = [NSString stringWithFormat:@"%@", self.datasourceItem];
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    [label setText:msg];

    [self addSubview:label];
}

#pragma mark - Stop Swift Subclassing

/**
 Subclassing this to crash swift apps, as this class should not be subclassed
 if you wish to create a custom cell, please use `ADXBasicCollectionViewCell`
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    ADXAssert(self == [ADXBasicCollectionViewCell class], @"Subclassing ADXBasicCollectionViewCell not allowed.");

    return [super allocWithZone:zone];
}

@end

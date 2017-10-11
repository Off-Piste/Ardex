//
//  ADXBasicTableViewCell.m
//  Ardex
//
//  Created by Harry Wright on 11.10.17.
//

#import "ADXBasicTableViewCell.h"

inline static CGRect cg_rect_make_from_cell(CGRect rect) {
    return CGRectMake(16, 0, rect.size.width, rect.size.height);
}

@implementation ADXBasicTableViewCell

- (void)configureCell {
    [super configureCell];

    CGRect rect = cg_rect_make_from_cell(self.bounds);
    NSString *msg = [NSString stringWithFormat:@"%@", self.datasourceItem];
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    [label setText:msg];

    [self addSubview:label];
}

@end

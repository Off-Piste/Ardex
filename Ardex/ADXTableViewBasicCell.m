//
//  ADXTableViewBasicCell.m
//  Pods
//
//  Created by Harry Wright on 14.07.17.
//
//

#import "ADXTableViewBasicCell.h"

@implementation ADXTableViewBasicCell

+ (NSString *)reuseID {
    return @"BasicCell";
}

- (void)configureCell {
    [super configureCell];
    
    NSString *value;
    BOOL test = [self.datasourceItem isKindOfClass:[NSString class]];
    if (test) {
        value = self.datasourceItem;
        (self.label).text = value;
    } else {
        (self.label).text = [NSString stringWithFormat:@"%@",
                             self.datasourceItem];
    }
}

- (void)setupViews {
    [super setupViews];
    
    self.label = [[UILabel alloc] init];
    self.label.textColor = [UIColor blackColor];
    
    [self addSubview:self.label];
    [self.label anchorForTop:self.topAnchor
                        left:self.leftAnchor
                      bottom:self.bottomAnchor
                       right:self.rightAnchor
                 topConstant:0
                leftConstant:10
              bottomConstant:0
               rightConstant:10
               widthConstant:0
              heightConstant:0];
}

@end

//
//  UIView+Anchoring.m
//  Pods
//
//  Created by Harry Wright on 13.07.17.
//
//

#import "UIView+Anchoring.h"

@implementation UIView (Anchoring)

- (void)addConstraintsWithFormat:(NSString*)format views:(UIView*)views, ... {
    NSMutableDictionary<NSString*, UIView*> *viewsDictionary;
    
    va_list args;
    va_start(args, views);
    NSInteger *index = 0;
    for (UIView *arg = views; arg != nil; arg = va_arg(args, UIView*)) {
        
        NSString *key = [NSString stringWithFormat:@"v%@",
                         @(*index).stringValue];
        [viewsDictionary setValue:arg forKeyPath:key];
        [arg setTranslatesAutoresizingMaskIntoConstraints:NO];
        index++;
    }
    va_end(args);
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format
                                                                 options:NSLayoutFormatAlignAllTop
                                                                 metrics:nil
                                                                   views:viewsDictionary]];
}

- (void)fillSuperview {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    if (self.superview) {
        [[self.leftAnchor constraintEqualToAnchor:self.superview.leftAnchor] setActive:YES];
        [[self.rightAnchor constraintEqualToAnchor:self.superview.rightAnchor] setActive:YES];
        [[self.topAnchor constraintEqualToAnchor:self.superview.topAnchor] setActive:YES];
        [[self.bottomAnchor constraintEqualToAnchor:self.superview.bottomAnchor] setActive:YES];
    }
}

- (void)anchorForTop:(NSLayoutYAxisAnchor *)top
                left:(NSLayoutXAxisAnchor *)left
              bottom:(NSLayoutYAxisAnchor *)bottom
               right:(NSLayoutXAxisAnchor *)right
         topConstant:(CGFloat)topConstant
        leftConstant:(CGFloat)leftConstant
      bottomConstant:(CGFloat)bottomConstant
       rightConstant:(CGFloat)rightConstant
       widthConstant:(CGFloat)widthConstant
      heightConstant:(CGFloat)heightConstant {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self anchorWithReturnAnchorsForTop:top left:left bottom:bottom right:right topConstant:topConstant leftConstant:leftConstant bottomConstant:bottomConstant rightConstant:rightConstant widthConstant:widthConstant heightConstant:heightConstant];
}

- (NSArray<NSLayoutConstraint *> *)anchorWithReturnAnchorsForTop:(NSLayoutYAxisAnchor *)top
                                                            left:(NSLayoutXAxisAnchor *)left
                                                          bottom:(NSLayoutYAxisAnchor *)bottom
                                                           right:(NSLayoutXAxisAnchor *)right
                                                     topConstant:(CGFloat)topConstant
                                                    leftConstant:(CGFloat)leftConstant
                                                  bottomConstant:(CGFloat)bottomConstant
                                                   rightConstant:(CGFloat)rightConstant
                                                   widthConstant:(CGFloat)widthConstant
                                                  heightConstant:(CGFloat)heightConstant {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSMutableArray<NSLayoutConstraint *> *anchors = [[NSMutableArray alloc] init];
    
    if (top) {
        [anchors addObject:[self.topAnchor constraintEqualToAnchor:top
                                                          constant:topConstant]];
    }
    
    if (bottom) {
        [anchors addObject:[self.bottomAnchor constraintEqualToAnchor:bottom
                                                             constant:-bottomConstant]];
    }
    
    if (left) {
        [anchors addObject:[self.leftAnchor constraintEqualToAnchor:left
                                                           constant:topConstant]];
    }
    
    if (right) {
        [anchors addObject:[self.rightAnchor constraintEqualToAnchor:right
                                                            constant:-rightConstant]];
    }
    
    if (widthConstant > 0) {
        [anchors addObject:[self.widthAnchor constraintEqualToConstant:widthConstant]];
    }
    
    if (heightConstant > 0) {
        [anchors addObject:[self.heightAnchor constraintEqualToConstant:heightConstant]];
    }
    
    [anchors enumerateObjectsUsingBlock:^(NSLayoutConstraint *obj, NSUInteger idx, BOOL *stop) {
        [obj setActive:YES];
    }];
    
    return anchors;
}

- (void)anchorCenterXToSuperviewWithConstant:(CGFloat)aConstant {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    if ((self.superview).centerXAnchor) {
        NSLayoutXAxisAnchor *anchor = (self.superview).centerXAnchor;
        [self.centerXAnchor constraintEqualToAnchor:anchor constant:aConstant];
    }
}

- (void)anchorCenterYToSuperviewWithConstant:(CGFloat)aConstant {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    if ((self.superview).centerYAnchor) {
        NSLayoutYAxisAnchor *anchor = (self.superview).centerYAnchor;
        [self.centerYAnchor constraintEqualToAnchor:anchor constant:aConstant];
    }
}

- (void)anchorCenterSuperview {
    [self anchorCenterXToSuperviewWithConstant:0];
    [self anchorCenterYToSuperviewWithConstant:0];
}

@end

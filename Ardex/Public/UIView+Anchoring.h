//
//  UIView+Anchoring.h
//  Pods
//
//  Created by Harry Wright on 13.07.17.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Anchoring)

- (void)addConstraintsWithFormat:(NSString*)format views:(UIView*)views, ...;

- (void)fillSuperview;

- (void)anchorForTop:(NSLayoutYAxisAnchor* _Nullable)top
                left:(NSLayoutXAxisAnchor* _Nullable)left
              bottom:(NSLayoutYAxisAnchor* _Nullable)bottom
               right:(NSLayoutXAxisAnchor* _Nullable)right
         topConstant:(CGFloat)topConstant
        leftConstant:(CGFloat)leftConstant
      bottomConstant:(CGFloat)bottomConstant
       rightConstant:(CGFloat)rightConstant
       widthConstant:(CGFloat)widthConstant
      heightConstant:(CGFloat)heightConstant;

-(NSArray<NSLayoutConstraint *> *)anchorWithReturnAnchorsForTop:(NSLayoutYAxisAnchor* _Nullable)top
                                                           left:(NSLayoutXAxisAnchor* _Nullable)left
                                                         bottom:(NSLayoutYAxisAnchor* _Nullable)bottom
                                                          right:(NSLayoutXAxisAnchor* _Nullable)right
                                                    topConstant:(CGFloat)topConstant
                                                   leftConstant:(CGFloat)leftConstant
                                                 bottomConstant:(CGFloat)bottomConstant
                                                  rightConstant:(CGFloat)rightConstant
                                                  widthConstant:(CGFloat)widthConstant
                                                 heightConstant:(CGFloat)heightConstant;

- (void)anchorCenterXToSuperviewWithConstant:(CGFloat)aConstant;

- (void)anchorCenterYToSuperviewWithConstant:(CGFloat)aConstant;

- (void)anchorCenterSuperview;

@end

NS_ASSUME_NONNULL_END

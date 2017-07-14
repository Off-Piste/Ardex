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

/**
 <#Description#>

 @param format <#format description#>
 @param views <#views description#>
 */
- (void)addConstraintsWithFormat:(NSString*)format views:(UIView*)views, ...;

/**
 <#Description#>
 */
- (void)fillSuperview;

/**
 <#Description#>

 @param top <#top description#>
 @param left <#left description#>
 @param bottom <#bottom description#>
 @param right <#right description#>
 @param topConstant <#topConstant description#>
 @param leftConstant <#leftConstant description#>
 @param bottomConstant <#bottomConstant description#>
 @param rightConstant <#rightConstant description#>
 @param widthConstant <#widthConstant description#>
 @param heightConstant <#heightConstant description#>
 */
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

/**
 <#Description#>

 @param top <#top description#>
 @param left <#left description#>
 @param bottom <#bottom description#>
 @param right <#right description#>
 @param topConstant <#topConstant description#>
 @param leftConstant <#leftConstant description#>
 @param bottomConstant <#bottomConstant description#>
 @param rightConstant <#rightConstant description#>
 @param widthConstant <#widthConstant description#>
 @param heightConstant <#heightConstant description#>
 @return <#return value description#>
 */
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

/**
 <#Description#>

 @param aConstant <#aConstant description#>
 */
- (void)anchorCenterXToSuperviewWithConstant:(CGFloat)aConstant;

/**
 <#Description#>

 @param aConstant <#aConstant description#>
 */
- (void)anchorCenterYToSuperviewWithConstant:(CGFloat)aConstant;

/**
 <#Description#>
 */
- (void)anchorCenterSuperview;

@end

NS_ASSUME_NONNULL_END

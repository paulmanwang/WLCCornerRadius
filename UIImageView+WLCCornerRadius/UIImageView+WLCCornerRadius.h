//
//  UIImageView+WLCCornerRadius.h
//  WLCCornerRadiusDemo
//
//  Created by lichunwang on 2018/2/11.
//  Copyright © 2018年 springcome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WLCCornerRadius)

- (void)wlc_setCornerRadius:(CGFloat)conerRadius cornerType:(UIRectCorner)cornerType;

- (void)wlc_setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

- (void)wlc_setImage:(UIImage *)image;

@end

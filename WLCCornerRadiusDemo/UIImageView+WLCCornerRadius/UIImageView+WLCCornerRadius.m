//
//  UIImageView+WLCCornerRadius.m
//  WLCCornerRadiusDemo
//
//  Created by lichunwang on 2018/2/11.
//  Copyright © 2018年 springcome. All rights reserved.
//

#import "UIImageView+WLCCornerRadius.h"
#import <objc/runtime.h>

static void *kCornerRaduis = &kCornerRaduis;
static void *kCornerType = &kCornerType;
static void *kBorderWidth = &kBorderWidth;
static void *kBorderColor = &kBorderColor;

@implementation UIImageView (WLCCornerRadius)

#pragma mark - Public Accessor

- (void)wlc_setCornerRadius:(CGFloat)cornerRadius cornerType:(UIRectCorner)cornerType
{
    self.cornerRadius = cornerRadius;
    self.cornerType = cornerType;
}

- (void)wlc_setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    self.borderWidth = borderWidth;
    self.borderColor = borderColor;
}

- (void)wlc_setImage:(UIImage *)image
{
    if (!image) {
        self.image = nil;
        return;
    }
    
    CGFloat cornerRadius = self.cornerRadius;
    if (cornerRadius == 0.f && self.borderWidth == 0.f) {
        self.image = image;
        return;
    }
    
    UIRectCorner cornerType = self.cornerType;
    CGFloat borderWidth = self.borderWidth;
    UIColor *borderColor = self.borderColor;
    CGRect rect = self.bounds;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
        if (UIGraphicsGetCurrentContext() == nil) {
            return;
        }
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:cornerType cornerRadii:cornerRadii];
        [path addClip];
        [image drawInRect:rect];
        
        // draw border
        if (borderWidth > 0) {
            path.lineWidth = borderWidth;
            [borderColor setStroke];
            [path stroke];
        }
        
        UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = processedImage;
        });
    });
}

#pragma mark - Setter && Getter

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    objc_setAssociatedObject(self, kCornerRaduis, @(cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)cornerRadius
{
    return [objc_getAssociatedObject(self, kCornerRaduis) floatValue];
}

- (void)setCornerType:(UIRectCorner)cornerType
{
    objc_setAssociatedObject(self, kCornerType, @(cornerType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)cornerType
{
    return [objc_getAssociatedObject(self, kCornerType) integerValue];
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    objc_setAssociatedObject(self, kBorderWidth, @(borderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)borderWidth
{
    return [objc_getAssociatedObject(self, kBorderWidth) floatValue];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    objc_setAssociatedObject(self, kBorderColor, borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)borderColor
{
    return objc_getAssociatedObject(self, kBorderColor);
}

@end

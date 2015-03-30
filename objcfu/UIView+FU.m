//
// Created by Johnny Sparks on 2/26/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "UIView+FU.h"
#import <objc/runtime.h>

static NSUInteger sFUTappingSelectorIdentifier = 0;

@implementation UIView (FU)
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = self.superview.size.width - frame.size.width - right;
    self.frame = frame;
}

- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = self.superview.height - frame.size.height - bottom;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.centerY);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.centerX, centerY);
}

+ (UIView *) withColor:(UIColor *)color {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    return view;
}

- (void)on:(NSUInteger)tapCount taps:(HITapHandler)handler
{
    self.userInteractionEnabled = YES;

    NSString *selectorName = [NSString stringWithFormat:@"fu_tapGestureSelector_%d:",sFUTappingSelectorIdentifier++];
    SEL newSelector = NSSelectorFromString(selectorName);

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:newSelector];
    tapGesture.numberOfTouchesRequired = tapCount;
    tapGesture.cancelsTouchesInView = NO;
    [self addGestureRecognizer:tapGesture];

    __block HITapHandler handlerCopy = [handler copy];
    IMP implementation = imp_implementationWithBlock(^{
        handlerCopy(tapGesture);
    });
    class_addMethod([self class], newSelector, implementation, "v@:@");
}

@end
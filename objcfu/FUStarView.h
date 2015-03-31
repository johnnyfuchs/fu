//
// Created by Johnny Sparks on 3/28/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FUStar;

@interface FUStarView : UIView

@property(nonatomic, strong) FUStar *star;

- (void)setEffectsVisible:(BOOL)visible;

@end
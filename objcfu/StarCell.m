//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "StarCell.h"
#import "FUStar.h"


@implementation StarCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView removeFromSuperview];
        self.backgroundColor = [UIColor colorWithHue:0.4 saturation:0.8 brightness:0.7 alpha:1];
    }
    return self;
}

@end
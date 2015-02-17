//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FURegion.h"
#import <UIKit/UIKit.h>

@implementation FURegion

+ (instancetype)regionX:(NSInteger)x y:(NSInteger)y {
    FURegion *region = FURegion.new;
    region.x = x;
    region.y = y;
    return region;
}

- (NSUInteger)hash {
    return (NSUInteger) (self.x ^ self.y);
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return self.x == ((FURegion *)other).x && self.y == ((FURegion *)other).y;
}

- (id)copyWithZone:(struct _NSZone *)zone {
    FURegion *copy = FURegion.new;

    if (copy != nil) {
        copy.y = self.y;
        copy.x = self.x;
    }

    return copy;
}


@end
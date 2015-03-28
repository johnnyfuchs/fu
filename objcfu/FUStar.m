//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUStar.h"
#import "FUBody.h"
#import "FURegion.h"


@implementation FUStar

+ (instancetype)starWithMass:(NSUInteger)mass x:(NSUInteger)x y:(NSUInteger)y z:(NSUInteger)z type:(FUStarType)type inRegion:(FURegion *)region {
    FUStar *star = FUStar.new;
    star.mass = mass;
    star.x = x;
    star.y = y;
    star.z = z;
    star.type = type;
    return star;
}

- (UIColor *)color {
    CGFloat hue = (self.region.x + 8.) / 16.;
    CGFloat sat = (self.region.y + 8.) / 16.;
    return [UIColor colorWithHue:hue saturation:sat brightness:.8 alpha:1];
}


- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;
    return NO;
}

- (id)copyWithZone:(NSZone *)zone {
    FUStar *star = [FUStar starWithMass:self.mass x:self.x y:self.y z:self.z type:self.type inRegion:self.region];
    return star;
}


@end
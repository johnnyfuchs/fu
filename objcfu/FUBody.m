//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUBody.h"


@implementation FUBody


+ (instancetype)bodyWithMass:(NSUInteger)mass x:(NSUInteger)x y:(NSUInteger)y z:(NSUInteger)z {
    FUBody *body = FUBody.new;
    body.mass = mass;
    body.x = x;
    body.y = y;
    body.z = z;
    return body;
}

@end
//
// Created by Johnny Sparks on 3/27/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "NSArray+FU.h"


@implementation NSArray (FU)
- (void)each:(void (^)(id obj))block {
    for(id item in self){
        block(item);
    }
}

@end
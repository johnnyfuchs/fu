//
// Created by Johnny Sparks on 3/27/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FU)
- (void) each:(void (^)(id obj))block;
@end
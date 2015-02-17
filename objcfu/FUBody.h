//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FUBody : NSObject
@property (nonatomic) NSUInteger x;
@property (nonatomic) NSUInteger y;
@property (nonatomic) NSUInteger z;
@property (nonatomic) NSUInteger mass;

+ (instancetype) bodyWithMass:(NSUInteger)mass x:(NSUInteger)x y:(NSUInteger)y z:(NSUInteger)z;

@end
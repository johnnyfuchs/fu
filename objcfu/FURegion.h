//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FURegion : NSObject <NSCopying>
@property (nonatomic) NSUInteger x;
@property (nonatomic) NSUInteger y;

+(instancetype)regionX:(NSUInteger)x y:(NSUInteger)y;

@end
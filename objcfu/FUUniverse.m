//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUUniverse.h"
#import "FUStar.h"
#import "FURegion.h"


@implementation FUUniverse


- (instancetype)init {
    self = [super init];
    if (self) {
        self.seed = @"a8d778e887f8884ff8c8e8";
        self.regionSize = CGSizeMake(100, 100);
        self.size = CGSizeMake(1000000, 1000000);//CGSizeMake(NSUIntegerMax, NSUIntegerMax);
    }
    return self;
}

- (CGPoint)center {
    return CGPointMake(self.size.width / 2, self.size.height / 2);
}

- (NSArray *)starsInRegion:(FURegion *)region {
    NSMutableArray *stars = [NSMutableArray new];
    NSInteger numberOfStars = 5 + arc4random_uniform(10);
    while (numberOfStars--){
        CGFloat x = arc4random_uniform((u_int32_t) floor(self.regionSize.width));
        CGFloat y = arc4random_uniform((u_int32_t) floor(self.regionSize.height));
        [stars addObject:[FUStar starWithMass:0 x:x y:y z:0 type:FUStarTypeM]];
    }
    return stars;
}

- (NSArray *)planetsForStar:(FUStar *)star inRegion:(NSIndexPath *)region {
    return nil;
}

@end
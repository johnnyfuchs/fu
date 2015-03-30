//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUUniverse.h"
#import "FUStar.h"
#import "FURegion.h"


@interface FUUniverse ()
@property(nonatomic, strong) NSMutableDictionary *starCache;
@property(nonatomic) int starCacheCount;
@end

@implementation FUUniverse


- (instancetype)init {
    self = [super init];
    if (self) {
        self.seed = @"a8d778e887f8884ff8c8e8";
        self.regionSize = CGSizeMake(1000, 1000);
        self.size = CGSizeMake(10000000000000000, 10000000000000000);
        self.starCache = NSMutableDictionary.new;
        self.starCacheCount = 0;
    }
    return self;
}

- (CGPoint)center {
    return CGPointMake(self.size.width / 2, self.size.height / 2);
}

- (NSArray *)starsInRegion:(FURegion *)region {

    if(self.starCache[region]){
        return self.starCache[region];
    }
    NSMutableArray *stars = NSMutableArray.new;
    NSInteger numberOfStars = 5 + arc4random_uniform(15);
    while (numberOfStars--){
        CGFloat x = arc4random_uniform((u_int32_t) floor(self.regionSize.width));
        CGFloat y = arc4random_uniform((u_int32_t) floor(self.regionSize.height));
        [stars addObject:[FUStar starWithMass:0 x:x y:y z:0 type:FUStarTypeM inRegion:region]];
    }
    self.starCache[region] = stars;
    self.starCacheCount += stars.count;
    NSLog(@"star total : %i", self.starCacheCount);
    return stars;
}

- (NSArray *)planetsForStar:(FUStar *)star inRegion:(NSIndexPath *)region {
    return nil;
}

@end
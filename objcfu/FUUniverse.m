//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUUniverse.h"
#import "FUStar.h"


@implementation FUUniverse {

}
- (NSString *)seed {
    return @"a8d778e887f8884ff8c8e8";
}

- (NSArray *)starsInRegion:(NSIndexPath *)region {
//    return [
//            Star(x: 0, y: 0, z: 0, mass: 0, type: .M),
//    Star(x: 100, y: 100, z: 0, mass: 0, type: .M),
//    Star(x: 120, y: 190, z: 0, mass: 0, type: .M),
//    Star(x: 180, y: 80, z: 0, mass: 0, type: .M),
//    Star(x: 90, y: 380, z: 0, mass: 0, type: .M),
//    Star(x: 480, y: 480, z: 0, mass: 0, type: .M),
//    Star(x: 80, y: 280, z: 0, mass: 0, type: .M),
//    Star(x: 0, y: 480, z: 0, mass: 0, type: .M),
//    Star(x: 480, y: 0, z: 0, mass: 0, type: .M),
//    ]
    return @[
            [FUStar starWithMass:0 x:100 y:100 z:0 type:FUStarTypeM],
            [FUStar starWithMass:0 x:120 y:190 z:0 type:FUStarTypeM],
            [FUStar starWithMass:0 x:180 y:80 z:0 type:FUStarTypeM],
            [FUStar starWithMass:0 x:90 y:380 z:0 type:FUStarTypeM],
            [FUStar starWithMass:0 x:480 y:480 z:0 type:FUStarTypeM],
            [FUStar starWithMass:0 x:80 y:280 z:0 type:FUStarTypeM],
            [FUStar starWithMass:0 x:480 y:0 z:0 type:FUStarTypeM],
    ];
}

- (NSArray *)planetsForStar:(FUStar *)star inRegion:(NSIndexPath *)region {
    return nil;
}

@end
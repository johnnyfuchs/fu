//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUPlanet.h"


@implementation FUPlanet {

}
+ (instancetype)planetWithMass:(NSUInteger)mass x:(NSUInteger)x y:(NSUInteger)y z:(NSUInteger)z type:(FUPlanetType)type {
    FUPlanet *planet = (FUPlanet *) [super bodyWithMass:mass x:x y:y z:x];
    planet.type = type;
    return planet;
}

@end
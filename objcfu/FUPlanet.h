//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FUBody.h"

//enum PlanetType {
//    case Gas, Ice, Water
//}
//
//        public func ==(lhs: Planet, rhs: Planet) -> Bool {
//return (
//lhs.x == rhs.x
//&& lhs.y == rhs.y
//&& lhs.z == rhs.z
//&& lhs.mass == rhs.mass
//&& lhs.type == rhs.type
//)
//}
//
//public class Planet: Body {
//    let type:PlanetType = .Water
//
//    init(x: CGFloat, y: CGFloat, z: CGFloat, mass: CGFloat, type:PlanetType) {
//        super.init(x: x, y: y, z: z, mass: mass)
//        self.type = type
//    }
//
//    override public var description: String {
//        get { return "\(super.description) \(type)" }
//    }
//}

typedef enum {
    FUPlanetTypeGas,
    FUPlanetTypeWater,
    FUPlanetTypeIce,
} FUPlanetType;

@interface FUPlanet : FUBody
@property (nonatomic) FUPlanetType type;

+ (instancetype) planetWithMass:(NSUInteger)mass x:(NSUInteger)x y:(NSUInteger)y z:(NSUInteger)z type:(FUPlanetType)type;

@end
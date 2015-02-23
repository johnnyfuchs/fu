//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FUBody.h"
#import <UIKit/UIKit.h>

@class FURegion;


//enum StarType : Printable {
//    case M, G
//    var description: String {
//        get { return self == M ? "M" : "G" }
//    }
//}
//
//        public func ==(lhs: Star, rhs: Star) -> Bool {
//return (
//lhs.x == rhs.x
//&& lhs.y == rhs.y
//&& lhs.z == rhs.z
//&& lhs.mass == rhs.mass
//&& lhs.type == rhs.type
//&& lhs.region == rhs.region
//)
//}
//
//public class Star: Body, Equatable, Printable {
//    let type:StarType = .M
//    public var region:Region
//
//    init(x:CGFloat, y:CGFloat, z:CGFloat, mass:CGFloat, type:StarType){
//        self.region = Region(x: 0, y: 0)
//        super.init(x: x, y: y, z: z, mass: mass)
//        self.type = type
//    }
//
//    override public var description: String {
//        get { return "\(super.description) \(type)" }
//    }
//}

typedef enum {
    FUStarTypeM,
    FUStarTypeG,
} FUStarType;

@interface FUStar : FUBody
@property (nonatomic) FUStarType type;
@property (nonatomic) FURegion *region;
@property(nonatomic, strong) UIColor *color;

+ (instancetype) starWithMass:(NSUInteger)mass x:(NSUInteger)x y:(NSUInteger)y z:(NSUInteger)z type:(FUStarType)type;

@end
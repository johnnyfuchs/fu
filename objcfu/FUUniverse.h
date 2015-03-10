//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FUStar;
@class FURegion;


//public class Universe {
//    var seed:NSString = "a8d778e887f8884ff8c8e8"
//
//    func starsInRegion(region:Region) -> [Star] {
//        return [
//                Star(x: 0, y: 0, z: 0, mass: 0, type: .M),
//        Star(x: 100, y: 100, z: 0, mass: 0, type: .M),
//        Star(x: 120, y: 190, z: 0, mass: 0, type: .M),
//        Star(x: 180, y: 80, z: 0, mass: 0, type: .M),
//        Star(x: 90, y: 380, z: 0, mass: 0, type: .M),
//        Star(x: 480, y: 480, z: 0, mass: 0, type: .M),
//        Star(x: 80, y: 280, z: 0, mass: 0, type: .M),
//        Star(x: 0, y: 480, z: 0, mass: 0, type: .M),
//        Star(x: 480, y: 0, z: 0, mass: 0, type: .M),
//        ]
//    }
//
//    func planetsFor(star:Star, region:Region) -> [Planet] {
//        return [
//                Planet(x: -10, y: 10, z: 0, mass: 0, type: .Water)
//        ]
//    }
//}



@interface FUUniverse : NSObject
@property (nonatomic) CGSize size;
@property (nonatomic) CGPoint center;
@property (nonatomic) NSString *seed;
@property (nonatomic) CGSize regionSize;
- (NSArray *)starsInRegion:(FURegion *)region;
- (NSArray *)planetsForStar:(FUStar *)star inRegion:(NSIndexPath *)region;
@end
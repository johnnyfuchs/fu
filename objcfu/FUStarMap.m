//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUStarMap.h"
#import "FUUniverse.h"
#import "FUStar.h"
#import "FURegion.h"



//class StarMap {
//
//    let regionSize:CGSize
//    let originRegion:Region
//    var viewport:CGRect
//    let universe:Universe
//    var viewportStars:[Star]?
//            var regionStars:[Region:[Star]]
//
//    init() {
//        regionSize = CGSize(width: 500, height: 500)
//        originRegion = Region(x: 0, y: 0)
//        universe = Universe()
//        viewport = UIScreen.mainScreen().bounds
//        regionStars = [Region:[Star]]()
//    }
//
//    func regionAtPoint(point:CGPoint) -> Region {
//        // get the total offset of the rect based on the viewport's offset
//        let totalOffset = CGPoint(x: point.x + viewport.origin.x, y: point.y + viewport.origin.y)
//        let offsetRegion = Region(x: Int(ceil(totalOffset.x / regionSize.width)), y: Int(ceil(totalOffset.y / regionSize.height)))
//        return offsetRegion
//    }
//
//    func starsInRegion(region:Region) -> [Star] {
//        if regionStars[region] == nil {
//            regionStars[region] = universe.starsInRegion(region)
//        }
//        return regionStars[region]!
//    }
//
//    func regionsInRect(rect:CGRect) -> [Region] {
//
//        // rect : x: 0, y:0, w: 320, h: 500
//        // offset x: 0 y: 0
//
//        let startRegion = regionAtPoint(rect.origin)
//        let regionsWide = Int(ceil(rect.width / regionSize.width)) + 2
//        let regionsTall = Int(ceil(rect.height / regionSize.height)) + 2
//
//        var regions = [startRegion]
//        for x in 0...regionsWide {
//            for y in 0...regionsTall {
//                regions.append(Region(x: originRegion.x + x - 1, y: originRegion.y + y - 1))
//            }
//        }
//        return regions
//    }
//
//    func numberOfStarsInViewport() -> Int {
//        return starsInViewport().count
//    }
//
//    func starsInViewport() -> [Star] {
//        if viewportStars == nil {
//            viewportStars = starsInRect(viewport)
//        }
//        return viewportStars!
//    }
//
//    func starsInRect(rect:CGRect) -> [Star] {
//        var stars:[Star] = []
//        let regions = regionsInRect(rect)
//        for region in regions {
//            let regionStars = starsInRegion(region)
//            for star in regionStars {
//                star.region = region
//                stars.append(star)
//            }
//        }
//        return stars
//    }
//
//    func starForIndexPath(indexPath:NSIndexPath) -> Star {
//        return starsInViewport()[indexPath.item]
//    }
//}

@implementation FUStarMap

- (instancetype)init {
    self = [super init];
    if (self) {
        self.universe = FUUniverse.new;
        self.regionStars = NSMutableDictionary.new;
    }

    return self;
}

- (CGSize)regionSize {
    return self.universe.regionSize;
}

- (FURegion *)regionAtPoint:(CGPoint)point {

    NSInteger regionX = (NSInteger) floor(point.x / self.regionSize.width);
    NSInteger regionY = (NSInteger) floor(point.y / self.regionSize.height);

    FURegion *offsetRegion = [FURegion regionX:regionX y:regionY];
    return offsetRegion;
}

- (NSArray *)starsInRegion:(FURegion *)region {
    if(!self.regionStars[region]){
        self.regionStars[region] = [self.universe starsInRegion:region];
    }
    return self.regionStars[region];
}



- (NSArray *)regionsInRect:(CGRect)rect {

    FURegion *startRegion = [self regionAtPoint:rect.origin];
    NSUInteger regionsWide = (NSUInteger)ceil(rect.size.width / self.regionSize.width);
    NSUInteger regionsTall = (NSUInteger)ceil(rect.size.height / self.regionSize.height);

    NSMutableArray *regions = [NSMutableArray new];
    for(NSUInteger x = 0; x < regionsWide; x ++) {
        for(NSUInteger y = 0; y < regionsTall; y ++) {
            FURegion *region = [FURegion regionX:(startRegion.x + x ) y:(startRegion.y + y)];
            [regions addObject:region];
        }
    }
    return regions;
}

- (CGRect)frameForRegion:(FURegion *)region {
    return CGRectMake(
            self.regionSize.width * region.x,
            self.regionSize.height * region.y,
            self.regionSize.width,
            self.regionSize.height
    );
}


@end
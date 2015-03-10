//
// Created by Johnny Sparks on 3/9/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FUStarMap.h"
#import "FURegion.h"

@interface FUStarMapTests : XCTestCase
@property(nonatomic, strong) FUStarMap *starMap;
@end

@implementation FUStarMapTests

- (void)setUp {
    self.starMap = [FUStarMap new];
}

- (void) testRegionsInRect {
    CGSize regionSize = self.starMap.regionSize;
    NSArray *regions = [self.starMap regionsInRect:CGRectMake(0, 0, regionSize.width, regionSize.height)];
    FURegion *region = regions.firstObject;
    XCTAssertEqual(regions.count, 1);
    XCTAssertEqual(region.x, 0);
    XCTAssertEqual(region.y, 0);
}

- (void) testLargeRegionsInRect {
    CGSize regionSize = self.starMap.regionSize;
    NSArray *regions = [self.starMap regionsInRect:CGRectMake(0, 0, regionSize.width * 10, regionSize.height * 10)];
    FURegion *firstRegion = regions.firstObject;
    FURegion *lastRegion = regions.lastObject;
    XCTAssertEqual(regions.count, 100);
    XCTAssertEqual(firstRegion.x, 0);
    XCTAssertEqual(firstRegion.y, 0);
    XCTAssertEqual(lastRegion.x, 9);
    XCTAssertEqual(lastRegion.y, 9);
}

- (void) testOffsetRegionsInRect {
    CGSize regionSize = self.starMap.regionSize;
    NSArray *regions = [self.starMap regionsInRect:CGRectMake(regionSize.width, regionSize.height, regionSize.width * 10, regionSize.height * 10)];
    FURegion *firstRegion = regions.firstObject;
    FURegion *lastRegion = regions.lastObject;
    XCTAssertEqual(regions.count, 100);
    XCTAssertEqual(firstRegion.x, 1);
    XCTAssertEqual(firstRegion.y, 1);
    XCTAssertEqual(lastRegion.x, 10);
    XCTAssertEqual(lastRegion.y, 10);
}

- (void) testSecondOffsetRegionsInRect {
    CGSize regionSize = self.starMap.regionSize;
    NSArray *regions = [self.starMap regionsInRect:CGRectMake(regionSize.width + regionSize.width / 2, regionSize.height + regionSize.height / 2, regionSize.width * 10, regionSize.height * 10)];
    FURegion *firstRegion = regions.firstObject;
    FURegion *lastRegion = regions.lastObject;
    XCTAssertEqual(regions.count, 100);
    XCTAssertEqual(firstRegion.x, 2);
    XCTAssertEqual(firstRegion.y, 2);
    XCTAssertEqual(lastRegion.x, 11);
    XCTAssertEqual(lastRegion.y, 11);
}


@end
//
// Created by Johnny Sparks on 3/27/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUStarMapView.h"
#import "FUStarMap.h"
#import "FURegion.h"
#import "FUStar.h"
#import "NSArray+FU.h"


@interface FUStarMapView ()
@property (nonatomic, strong) NSMutableArray *loadedRegions;
@property (nonatomic, strong) FUStarMap *map;
@end

@implementation FUStarMapView


+ (instancetype)starMapViewWithFrame:(CGRect)frame andMap:(FUStarMap *)map {
    return [[FUStarMapView alloc] initWithFrame:frame andMap:map];
}

- (instancetype)initWithFrame:(CGRect)frame andMap:(FUStarMap *)map {
    self = [super initWithFrame:frame];
    if (self) {
        self.map = map;
        self.loadedRegions = NSMutableArray.new;
    }
    return self;
}


- (void)loadStarsInRect:(CGRect)rect {
    NSArray *regions = [self.map regionsInRect:rect];
    [regions each:^(FURegion *region) {
        if(![self.loadedRegions containsObject:region]){
            NSArray *stars = [self.map starsInRegion:region];
            [self addStars:stars];
        }
    }];
}

- (void) addStars:(NSArray *)stars {
    [stars each:^(FUStar *star) {
        UIView *starView = UIView.new;
        starView.backgroundColor = UIColor.greenColor;
        starView.frame = [self frameForStar:star];
        [self addSubview:starView];
    }];
}


- (CGRect)frameForStar:(FUStar *)star {
    CGFloat originX = star.x + (star.region.x * self.map.regionSize.width);
    CGFloat originY = star.y + (star.region.y * self.map.regionSize.height);
    return CGRectMake(originX, originY, 20, 20);
}

- (void)setViewPort:(CGRect)viewPort {
    _viewPort = viewPort;
    [self loadStarsInRect:viewPort];
}

@end
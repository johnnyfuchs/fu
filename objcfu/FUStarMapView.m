//
// Created by Johnny Sparks on 3/27/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUStarMapView.h"
#import "FUStarMap.h"
#import "FURegion.h"
#import "FUStar.h"
#import "NSArray+FU.h"
#import "FUStarView.h"
#import "FUUniverse.h"


@interface FUStarMapView ()
@property (nonatomic, strong) NSMutableArray *loadedRegions;
@property (nonatomic, strong) FUStarMap *map;
@property(nonatomic, strong) UIView *starContainer;
@property(nonatomic, strong) NSMutableArray *reusableStarViews;
@property(nonatomic) NSUInteger starViewReuseCounter;
@end

@implementation FUStarMapView


+ (instancetype)starMapViewWithFrame:(CGRect)frame andMap:(FUStarMap *)map {
    return [[FUStarMapView alloc] initWithFrame:frame andMap:map];
}

- (instancetype)initWithFrame:(CGRect)frame andMap:(FUStarMap *)map {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.grayColor;
        self.map = map;
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;

        CGRect universeRect = CGRectMake(
                0,
                0,
                self.map.universe.size.width,
                self.map.universe.size.height
        );

        self.starContainer = [[UIView alloc] initWithFrame:universeRect];
        [self addSubview:self.starContainer];

        self.minimumZoomScale = 0.05f;
        self.maximumZoomScale = 2.0f;
        self.contentSize = self.map.universe.size;
        self.contentOffset = self.map.universe.center;

        self.loadedRegions = NSMutableArray.new;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self scrollViewDidScroll:self];
}


- (void)loadStarsInRect:(CGRect)rect {

    NSArray *regions = [self.map regionsInRect:rect];
    [regions each:^(FURegion *region) {
        if(![self.loadedRegions containsObject:region]){
            NSArray *stars = [self.map starsInRegion:region];
            [self addStars:stars];
            [self.loadedRegions addObject:region];

//            ADD REGION MARKERS
//            CGRect frame = [self.map frameForRegion:region];
//            UIView *regionView = [[UIView alloc] initWithFrame:frame];
//            regionView.layer.borderColor = UIColor.redColor.CGColor;
//            regionView.layer.borderWidth = 4.0f;
//            regionView.backgroundColor = UIColor.clearColor;
//            [self.starContainer addSubview:regionView];
        }
    }];
}

- (void) addStars:(NSArray *)stars {
    [stars each:^(FUStar *star) {
        FUStarView *starView = [self reusableStarView];
        starView.star = star;
        starView.frame = [self frameForStar:star];
    }];
}

- (CGRect)frameForStar:(FUStar *)star {
    CGFloat originX = star.x + (star.region.x * self.map.regionSize.width);
    CGFloat originY = star.y + (star.region.y * self.map.regionSize.height);
    return CGRectMake(originX, originY, 20, 20);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGRect convertedRect = [self convertRect:self.bounds toView:self.starContainer];
    [self loadStarsInRect:convertedRect];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.starContainer;
}

- (FUStarView *)reusableStarView {

    NSUInteger reusableStarsCount = 10000;

    if(!self.reusableStarViews){
        self.reusableStarViews = NSMutableArray.new;

        while (reusableStarsCount--){
            FUStarView *starView = FUStarView.new;
            [self.reusableStarViews addObject:starView];
        }
    }
    if(self.starViewReuseCounter >= reusableStarsCount){
        self.starViewReuseCounter = 0;
    }

    NSUInteger reuseIndex = self.starViewReuseCounter;
    self.starViewReuseCounter += 1;

    FUStarView *starView = self.reusableStarViews[reuseIndex];
    if(!starView.superview){
        [self.starContainer addSubview:starView];
    }
    return starView;
}

@end
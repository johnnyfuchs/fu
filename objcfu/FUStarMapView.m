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

        self.minimumZoomScale = 0.25f;
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
        }
    }];
    NSLog(@"regions :%i", self.loadedRegions.count);
}

- (void) addStars:(NSArray *)stars {
    [stars each:^(FUStar *star) {
        FUStarView *starView = FUStarView.new;
        starView.backgroundColor = UIColor.greenColor;
        starView.frame = [self frameForStar:star];
        [self.starContainer addSubview:starView];
    }];
}


- (CGRect)frameForStar:(FUStar *)star {
    CGFloat originX = star.x + (star.region.x * self.map.regionSize.width);
    CGFloat originY = star.y + (star.region.y * self.map.regionSize.height);
    return CGRectMake(originX, originY, 20, 20);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scale = self.zoomScale;
    CGSize size = CGSizeMake(self.frame.size.width * 2, self.frame.size.height * 2);
    CGPoint origin = scrollView.contentOffset;
    CGRect viewPort = CGRectMake(
            origin.x - (size.width / scale),
            origin.y - (size.height / scale),
            (size.width * 2) / scale,
            (size.height * 2) / scale
    );
    
    [self loadStarsInRect:viewPort];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"loaded: %i", self.starContainer.subviews.count);

}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.starContainer;
}


@end
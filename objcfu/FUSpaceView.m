//
// Created by Johnny Sparks on 2/21/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUSpaceView.h"
#import "StarCell.h"
#import "FUStarMap.h"
#import "StarMapCollectionViewLayout.h"
#import "FUStar.h"
#import "FUStarMapView.h"
#import "UIView+FU.h"
#import "FUUniverse.h"
#import "FUStarMapView.h"


@interface FUSpaceView () <UICollectionViewDataSource, UIScrollViewDelegate>
@property (nonatomic) FUStarMap *map;
@property(nonatomic) CGRect viewPort;
@property(nonatomic, strong) FUStarMapView *mapView;
@end

@implementation FUSpaceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        // Setup Map
        self.map = FUStarMap.new;

        // Setup CollectionView
        self.mapView = [FUStarMapView starMapViewWithFrame:self.bounds andMap:self.map];
        self.mapView.delegate = self;
        self.mapView.pagingEnabled = NO;
        self.mapView.contentSize = self.map.universe.size;
        [self addSubview:self.mapView];

        // setup the default viewport
        self.viewPort = CGRectMake(self.map.universe.center.x, self.map.universe.center.y, 100, 100);
        self.mapView.contentOffset = self.viewPort.origin;
        self.mapView.viewPort = self.viewPort;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.mapView.frame = self.bounds;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGRect viewPort = self.viewPort;
    viewPort.origin.x += targetContentOffset->x;
    viewPort.origin.y += targetContentOffset->y;
    viewPort.size = self.frame.size;
    self.mapView.viewPort = viewPort;
}

@end
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


@interface FUSpaceView () <UIScrollViewDelegate>
@property (nonatomic) FUStarMap *map;
@property(nonatomic) CGRect viewPort;
@property(nonatomic, strong) FUStarMapView *mapView;
@property(nonatomic, strong) UILabel *label;
@end

@implementation FUSpaceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        // Setup Map
        self.map = FUStarMap.new;

        // Setup CollectionView
        self.mapView = [FUStarMapView starMapViewWithFrame:self.bounds andMap:self.map];
        self.mapView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.mapView];

    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.mapView.frame = self.bounds;
}

@end
//
// Created by Johnny Sparks on 2/21/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUSpaceView.h"
#import "FUStarMap.h"
#import "FUStarMapView.h"


@interface FUSpaceView () <UIScrollViewDelegate>
@property(nonatomic) FUStarMap *map;
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
        self.mapView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.mapView];

        NSDictionary *views = @{ @"map" : self.mapView };
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[map]" options:nil metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[map]" options:nil metrics:nil views:views]];

    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.mapView.frame = self.bounds;
}

@end
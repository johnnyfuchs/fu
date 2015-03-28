//
// Created by Johnny Sparks on 3/27/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FUStarMap;


@interface FUStarMapView : UIScrollView

@property (nonatomic) CGRect viewPort;

+ (instancetype)starMapViewWithFrame:(CGRect)frame andMap:(FUStarMap *)map;

@end
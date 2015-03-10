//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FUStarMap;

@interface StarMapCollectionViewLayout : UICollectionViewLayout
@property (nonatomic) FUStarMap *map;

@property(nonatomic) CGRect viewPort;
@property (nonatomic, readonly) NSArray *stars;

+ (instancetype)layoutWithMap:(FUStarMap *)map;

@end
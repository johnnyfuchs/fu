//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "StarMapCollectionViewLayout.h"
#import "FUStarMap.h"
#import "FUStar.h"
#import "FURegion.h"
#import "FUUniverse.h"

//
//
//override func prepareLayout() {
//
//}
//
//override func collectionViewContentSize() -> CGSize {
//return map.viewport.size
//}
//
//override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
//var paths = indexPathsInRect(rect)
//var allAttributes:[UICollectionViewLayoutAttributes] = []
//for path in paths {
//    allAttributes.append(layoutAttributesForItemAtIndexPath(path))
//}
//return allAttributes
//}
//
//func indexPathsInRect(rect: CGRect) -> [NSIndexPath] {
//var paths:[NSIndexPath] = []
//
//var allStars = map.starsInViewport()
//var viewStars = map.starsInRect(rect)
//
//var item = 0
//for star in allStars {
//    if find(viewStars, star) != nil {
//        paths.append(NSIndexPath(forItem: item, inSection: 0))
//    }
//    item += 1
//}
//return paths
//}
//override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
//let attributes:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
//let star = map.starForIndexPath(indexPath)
////        println("\(star)")
//let originX = star.x + CGFloat(star.region.x) * map.regionSize.width
//let originY = star.y + CGFloat(star.region.y) * map.regionSize.height
//attributes.frame = CGRectMake(originX, originY, 20, 20)
//return attributes
//}
//


@interface FUStarLayout : NSObject
@property FUStar *star;
@property FURegion *region;
@property NSIndexPath *indexPath;
@property CGRect frame;
@property UICollectionViewLayoutAttributes *attributes;
@end

@implementation FUStarLayout
@end

@interface StarMapCollectionViewLayout ()
@property(nonatomic, strong) NSMutableArray *starLayouts;
@property(nonatomic, strong) NSArray *regions;
@end

@implementation StarMapCollectionViewLayout

#pragma mark Initializers

+ (instancetype)layoutWithMap:(FUStarMap *)map {
    StarMapCollectionViewLayout *layout = StarMapCollectionViewLayout.new;
    layout.map = map;
    return layout;
}

#pragma mark UICollectionView Subclass

- (CGSize)collectionViewContentSize {
    return self.map.universe.size;
}

- (void)prepareLayout {
    [super prepareLayout];
    self.starLayouts = [NSMutableArray new];
    self.regions = [self.map regionsInRect:self.viewPort];
    NSUInteger starCounter = 0;
    for(FURegion *region in self.regions){
        NSArray *stars = [self.map starsInRegion:region];
        for(FUStar *star in stars){
            FUStarLayout *starLayout = [FUStarLayout new];
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:starCounter inSection:0];
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.frame = [self frameForStar:star inRegion:region];
            starLayout.attributes = attributes;
            starLayout.frame = attributes.frame;
            starLayout.indexPath = indexPath;
            starLayout.region = region;
            starLayout.star = star;
            starCounter += 1;
            [self.starLayouts addObject:starLayout];
        }
    }
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSLog(@"rect: %@", NSStringFromCGRect(rect));
    NSMutableArray *allAttributes = NSMutableArray.new;
    for(FUStarLayout *layout in self.starLayouts){
        if(CGRectIntersectsRect(rect, layout.attributes.frame)){
            [allAttributes addObject:layout.attributes];
        }
    }
    return allAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    FUStarLayout *layout = self.starLayouts[indexPath.item];
    return layout.attributes;
}

#pragma Mark DataSource

- (NSArray *)stars {
    return [self.starLayouts valueForKey:@"star"];
}


#pragma Mark Helpers

- (CGRect)frameForStar:(FUStar *)star inRegion:(FURegion *)region {
    CGFloat originX = star.x + (region.x * self.map.regionSize.width);
    CGFloat originY = star.y + (region.y * self.map.regionSize.height);
    return CGRectMake(originX, originY, 20, 20);
}

- (void)setViewPort:(CGRect)viewPort {
    _viewPort = viewPort;
    NSArray *regions = [self.map regionsInRect:viewPort];
    for(FURegion *region in regions){
        if(![self.regions containsObject:region]){
            NSLog(@"chaging regions because of new region: %@", region);
            [self.collectionView reloadData];
            return;
        }
    }
}


@end
//
// Created by Johnny Sparks on 2/16/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "StarMapCollectionViewLayout.h"
#import "FUStarMap.h"
#import "FUStar.h"
#import "FURegion.h"

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


@implementation StarMapCollectionViewLayout

+ (instancetype)layoutWithMap:(FUStarMap *)map {
    StarMapCollectionViewLayout *layout = StarMapCollectionViewLayout.new;
    layout.map = map;
    return layout;
}

- (CGSize)collectionViewContentSize {
    return self.map.viewport.size;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *paths = [self indexPathsInRect:rect];
    NSMutableArray *allAttributes = NSMutableArray.new;
    for(NSIndexPath *path in paths){
        [allAttributes addObject:[self layoutAttributesForItemAtIndexPath:path]];
    }
    return allAttributes;
}

- (NSArray *)indexPathsInRect:(CGRect)rect {
    NSMutableArray *paths = NSMutableArray.new;
    NSArray *allStars = [self.map starsInViewport];
    NSArray *viewStars = [self.map starsInRect:rect];
    NSInteger item = 0;
    for(FUStar *star in allStars){
        if([viewStars containsObject:star]){
            [paths addObject:[NSIndexPath indexPathForItem:item inSection:0]];
        }
        item += 1;
    }
    return paths;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    FUStar *star = [self.map starAtIndexPath:indexPath];
    CGFloat originX = star.x + star.region.x * self.map.regionSize.width;
    CGFloat originY = star.y + star.region.y * self.map.regionSize.height;
    attributes.frame = CGRectMake(originX, originY, 20, 20);
    return attributes;
}


@end
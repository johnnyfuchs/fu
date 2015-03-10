//
// Created by Johnny Sparks on 2/21/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUSpaceView.h"
#import "StarCell.h"
#import "FUStarMap.h"
#import "StarMapCollectionViewLayout.h"
#import "FUStar.h"
#import "UIView+FU.h"
#import "FUUniverse.h"


@interface FUSpaceView () <UICollectionViewDataSource, UIScrollViewDelegate>
@property(nonatomic, strong) FUCollectionView *collectionView;
@property (nonatomic) FUStarMap *map;
@end

@implementation FUSpaceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        // Setup Map
        self.map = FUStarMap.new;

        // Setup CollectionViewLayout
        StarMapCollectionViewLayout *layout = [StarMapCollectionViewLayout layoutWithMap:self.map];

        // Setup CollectionView
        self.collectionView = [FUCollectionView.alloc initWithFrame:self.bounds collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        self.collectionView.scrollDelegate = self;
        self.collectionView.pagingEnabled = NO;
        self.collectionView.contentSize = self.map.universe.size;
        [self.collectionView registerClass:[StarCell class] forCellWithReuseIdentifier:@"starCell"];
        [self addSubview:self.collectionView];

        // setup the default viewport
        self.starLayout.viewPort = CGRectMake(self.map.universe.center.x, self.map.universe.center.y, 100, 100);
        self.collectionView.contentOffset = self.starLayout.viewPort.origin;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.collectionView.frame = self.bounds;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSUInteger starCount = self.starLayout.stars.count;
    return starCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"starCell" forIndexPath:indexPath];
    FUStar *star = self.starLayout.stars[indexPath.item];
    cell.backgroundColor = star.color;
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGRect viewPort = self.starLayout.viewPort;
    viewPort.origin.x += targetContentOffset->x;
    viewPort.origin.y += targetContentOffset->y;
    viewPort.size = self.collectionView.frame.size;
    self.starLayout.viewPort = viewPort;
}

- (StarMapCollectionViewLayout *) starLayout {
    return (StarMapCollectionViewLayout *) self.collectionView.collectionViewLayout;
}

@end
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


@interface FUSpaceView () <UICollectionViewDataSource, UIScrollViewDelegate>
@property(nonatomic, strong) FUCollectionView *collectionView;
@property (nonatomic) FUStarMap *map;
@property (nonatomic) CGRect endScrollingViewport;
@property (nonatomic, readonly) CGRect centerRect;
@property(nonatomic) CGRect nextViewport;
@property(nonatomic) BOOL willHitScrollEdge;
@end

@implementation FUSpaceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        // Setup Map
        self.map = FUStarMap.new;
        self.map.viewport = CGRectMake(0, 0, self.width * 3, self.height * 3);

        // Setup CollectionViewLayout
        StarMapCollectionViewLayout *layout = [StarMapCollectionViewLayout layoutWithMap:self.map];

        // Setup CollectionView
        self.collectionView = [FUCollectionView.alloc initWithFrame:self.bounds collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        self.collectionView.scrollDelegate = self;
        self.collectionView.pagingEnabled = YES;
        [self.collectionView registerClass:[StarCell class] forCellWithReuseIdentifier:@"starCell"];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.collectionView.frame = self.bounds;
    self.map.viewport = CGRectMake(0, 0, self.width * 3, self.height * 3);
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger stars = [self.map starsInViewport].count;
    return stars;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"starCell" forIndexPath:indexPath];
    FUStar *star = [self.map starAtIndexPath:indexPath];
    cell.backgroundColor = star.color;
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    BOOL left = targetContentOffset->x < kScrollEdgeThreshold;
    BOOL top =  targetContentOffset->y < kScrollEdgeThreshold;
    BOOL bottom = targetContentOffset->x > (self.collectionView.contentSize.width - self.collectionView.width) - kScrollEdgeThreshold;
    BOOL right = targetContentOffset->y > (self.collectionView.contentSize.height - self.collectionView.height) - kScrollEdgeThreshold;
    if( left || top || bottom || right ){
        CGRect port = self.map.viewport;
        port.origin.y -= targetContentOffset->y;
        port.origin.x -= targetContentOffset->x;
        self.map.viewport = port;
        NSLog(@"%@", NSStringFromCGRect(self.map.viewport));
        NSLog(@"%@", self.map.regionsInViewport);
        NSLog(@"%lu", self.map.starsInViewport.count);
        [self.collectionView reloadData];
        [self.collectionView scrollRectToVisible:CGRectMake(self.width, self.height, self.width, self.height) animated:NO];
    }
}


//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    if(self.willHitScrollEdge){
//        CGRect viewport = self.map.viewport;
//        viewport.origin.x += scrollView.contentOffset.x - scrollView.frame.size.width;
//        viewport.origin.y += scrollView.contentOffset.y - scrollView.frame.size.height;
//        self.map.viewport = viewport;
////        [self snapToCenterOfViewport];
//        self.willHitScrollEdge = NO;
//        [self.collectionView reloadData];
//        NSLog(@"viewport: %@", NSStringFromCGRect(self.map.viewport));
//        NSLog(@"viewport: %@", NSStringFromCGRect(scrollView.frame));
//    }
//}

//-(void)snapToCenterOfViewport {
//    self.collectionView.contentOffset = CGPointMake(self.frame.size.width, self.frame.size.height);
//}

@end
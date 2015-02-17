//
//  ViewController.m
//  objcfu
//
//  Created by Johnny Sparks on 2/16/15.
//  Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "ViewController.h"
#import "FUStarMap.h"
#import "StarMapCollectionViewLayout.h"
#import "StarCell.h"

//var starMap:StarMap
//        var collectionView:UICollectionView
//
//convenience override init() {
//    self.init(coder: NSCoder.empty())
//}
//
//required init(coder aDecoder: NSCoder) {
//    starMap = StarMap()
//    collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: StarMapCollectionViewLayout(map: starMap))
//    super.init(coder: aDecoder)
//    collectionView.delegate = self
//    collectionView.dataSource = self
//    collectionView.pagingEnabled = true
//    collectionView.registerClass(StarCell.self, forCellWithReuseIdentifier: "starCell")
//}
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    // Do any additional setup after loading the view, typically from a nib.
//
//    collectionView.frame = view.bounds
//    starMap.viewport = CGRectMake(0, 0, view.bounds.size.width * 3, view.bounds.size.height * 3)
//    view.addSubview(collectionView)
//    collectionView.reloadData()
//}
//
//func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//return 1;
//}
//
//func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//return starMap.numberOfStarsInViewport()
//}
//
//// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
//func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//let cell:StarCell = collectionView.dequeueReusableCellWithReuseIdentifier("starCell", forIndexPath: indexPath) as StarCell
//return cell
//}
//

//
//func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//    // update the viewport
//
//    println("\(targetContentOffset.memory.x) \(targetContentOffset.memory.y)")
//}



@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) FUStarMap *map;
@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.map = FUStarMap.new;
        StarMapCollectionViewLayout *layout = [StarMapCollectionViewLayout layoutWithMap:self.map];
        self.collectionView = [UICollectionView.alloc initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        self.collectionView.pagingEnabled = YES;
        [self.collectionView registerClass:[StarCell class] forCellWithReuseIdentifier:@"starCell"];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.frame = self.view.bounds;
    self.map.viewport = CGRectMake(0, 0, self.view.bounds.size.width * 7, self.view.bounds.size.height * 7);
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger stars = [self.map starsInViewport].count;
    return stars;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"starCell" forIndexPath:indexPath];
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"%@", NSStringFromCGPoint(*targetContentOffset));
}


@end

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
#import "FUCollectionView.h"
#import "FUSpaceView.h"

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



@interface ViewController ()
@property (nonatomic) FUSpaceView *spaceView;
@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.spaceView = FUSpaceView.new;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.spaceView.frame = self.view.bounds;
    [self.view addSubview:self.spaceView];
}



@end

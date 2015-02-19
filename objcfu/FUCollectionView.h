//
// Created by Johnny Sparks on 2/18/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FUCollectionView : UICollectionView
@property (nonatomic, weak) id<UICollectionViewDelegate> collectionDelegate;
@property (nonatomic, weak) id<UIScrollViewDelegate> scrollDelegate;
@end
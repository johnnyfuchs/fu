//
// Created by Johnny Sparks on 2/18/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUCollectionView.h"


@interface FUCollectionView () <UICollectionViewDelegate>
@end

@implementation FUCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
    }
    return self;
}

#pragma mark CollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:shouldHighlightItemAtIndexPath:)]){
        return [self.collectionDelegate collectionView:collectionView shouldHighlightItemAtIndexPath:indexPath];
    }
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:didHighlightItemAtIndexPath:)]){
        [self.collectionDelegate collectionView:collectionView didHighlightItemAtIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:didUnhighlightItemAtIndexPath:)]){
        [self.collectionDelegate collectionView:collectionView didUnhighlightItemAtIndexPath:indexPath];
    }
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:shouldSelectItemAtIndexPath:)]){
        return [self.collectionDelegate collectionView:collectionView shouldSelectItemAtIndexPath:indexPath];
    }
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:shouldDeselectItemAtIndexPath:)]){
        return [self.collectionDelegate collectionView:collectionView shouldDeselectItemAtIndexPath:indexPath];
    }
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)]){
        [self.collectionDelegate collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:didDeselectItemAtIndexPath:)]){
        [self.collectionDelegate collectionView:collectionView didDeselectItemAtIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:willDisplayCell:forItemAtIndexPath:)]){
        [self.collectionDelegate collectionView:self willDisplayCell:cell forItemAtIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:)]){
        [self.collectionDelegate collectionView:collectionView willDisplaySupplementaryView:view forElementKind:elementKind atIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:didEndDisplayingCell:forItemAtIndexPath:)]){
        [self.collectionDelegate collectionView:self didEndDisplayingCell:cell forItemAtIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:didEndDisplayingSupplementaryView:forElementOfKind:atIndexPath:)]){
        [self.collectionDelegate collectionView:collectionView didEndDisplayingSupplementaryView:view forElementOfKind:elementKind atIndexPath:indexPath];
    }
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:shouldShowMenuForItemAtIndexPath:)]){
        return [self.collectionDelegate collectionView:collectionView shouldShowMenuForItemAtIndexPath:indexPath];
    }
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:canPerformAction:forItemAtIndexPath:withSender:)]){
        return [self.collectionDelegate collectionView:collectionView canPerformAction:action forItemAtIndexPath:indexPath withSender:sender];
    }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:performAction:forItemAtIndexPath:withSender:)]){
        [self.collectionDelegate collectionView:collectionView performAction:action forItemAtIndexPath:indexPath withSender:sender];
    }
}

- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout {
    if(self.collectionDelegate && [self.collectionDelegate respondsToSelector:@selector(collectionView:transitionLayoutForOldLayout:newLayout:)]){
        return [self.collectionDelegate collectionView:collectionView transitionLayoutForOldLayout:fromLayout newLayout:toLayout];
    }
    return [UICollectionViewTransitionLayout.alloc initWithCurrentLayout:fromLayout nextLayout:toLayout];;
}


#pragma mark ScrollView Forwarding

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(scrollViewDidScroll:)]){
        [self.scrollDelegate scrollViewDidScroll:scrollView];
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    if(self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(scrollViewShouldScrollToTop:)]) {
        return [self.scrollDelegate scrollViewShouldScrollToTop:scrollView];
    }
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if(self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(scrollViewDidScrollToTop:)]){
        [self.scrollDelegate scrollViewDidScrollToTop:scrollView];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if(self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]){
        [self.scrollDelegate scrollViewWillBeginDragging:scrollView];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if(self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(scrollViewWillEndDragging:withVelocity:targetContentOffset:)]){
        [self.scrollDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if(self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]){
        [self.scrollDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if(self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(scrollViewWillBeginDecelerating:)]){
        [self.scrollDelegate scrollViewWillBeginDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if(self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]){
        [self.scrollDelegate scrollViewDidEndDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if(self.scrollDelegate && [self.scrollDelegate respondsToSelector:@selector(scrollViewDidEndScrollingAnimation:)]){
        [self.scrollDelegate scrollViewDidEndScrollingAnimation:scrollView];
    }
}

@end
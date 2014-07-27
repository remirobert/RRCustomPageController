//
//  RRCustomPageController.m
//  RRCustomPageController
//
//  Created by Remi Robert on 18/07/14.
//  Copyright (c) 2014 remirobert. All rights reserved.
//

#import "RRCustomPageController.h"
#import "RRPageController.h"

@interface RRCustomPageController ()
{
    UIScrollView *pageScroll;
    NSArray *controllers;
    NSInteger currentPageIndex;
    BOOL animatedAnimation;
}
@end

@implementation RRCustomPageController

- (void) viewDidAppear:(BOOL)animated {
    [self initScrollPageView];
    [self initMenuBar];
    _menuBar.tag = 0;
    pageScroll.tag = 1;
    pageScroll.delegate = self;
    UITapGestureRecognizer *tapedMenuBar = [[UITapGestureRecognizer alloc]
                                            initWithTarget:self
                                                    action:@selector(touchBeganMenuBar:)];
    tapedMenuBar.numberOfTapsRequired = 1;
    tapedMenuBar.numberOfTouchesRequired = 1;
    [_menuBar addGestureRecognizer:tapedMenuBar];
    currentPageIndex = 0;
    animatedAnimation = NO;
}

- (void) touchBeganMenuBar:(UITapGestureRecognizer *)tapRecognizer {
    if (_clickScroll == NO)
        return ;
    
    CGFloat positionX = [tapRecognizer locationInView: _menuBar].x -
    _menuBar.contentSize.width / ([controllers count]) * currentPageIndex;
    
    if (positionX >= 0 && positionX < [UIScreen mainScreen].bounds.size.width / 4 && currentPageIndex - 1 >= 0) {
        currentPageIndex -= 1;
        [pageScroll setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * currentPageIndex,
                                                 pageScroll.contentOffset.y) animated:YES];
        return ;
    }
    if (positionX > [UIScreen mainScreen].bounds.size.width - [UIScreen mainScreen].bounds.size.width / 4 &&
                currentPageIndex + 1 < [controllers count]) {
        currentPageIndex += 1;
        [pageScroll setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * currentPageIndex,
                                                 pageScroll.contentOffset.y) animated:YES];
    }
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    currentPageIndex = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 1) {
        CGFloat pourcent = (pageScroll.contentOffset.x / pageScroll.contentSize.width) * 100.0 - 1;
    
        _menuBar.contentOffset = CGPointMake(_menuBar.contentSize.width * pourcent / 100, _menuBar.contentOffset.y);
    }
}

- (void)pop_animationDidStart:(POPAnimation *)anim {
    animatedAnimation = YES;
}

- (void)pop_animationDidReachToValue:(POPAnimation *)anim {
    animatedAnimation = NO;
}

- (void) initMenuBar {
    _menuBar.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 2.5 * [controllers count], 64);
    _menuBar.pagingEnabled = YES;
    _menuBar.scrollEnabled = NO;
    
    NSInteger index = 0;
    for (RRPageController *currentPage in controllers) {
        UIView *childView = [[UIView alloc] initWithFrame:
                             CGRectMake([UIScreen mainScreen].bounds.size.width / 2.5 * index,
                                    20, [UIScreen mainScreen].bounds.size.width, 64)];
        
        childView.backgroundColor = [UIColor clearColor];
        childView.userInteractionEnabled = YES;
        childView.exclusiveTouch = NO;
        childView.opaque = NO;
        
        if (currentPage.titlePage != nil) {
            UILabel *titleCurrentPage = [[UILabel alloc] initWithFrame:
                                         CGRectMake(0, 20 - (17 / 2), [UIScreen mainScreen].bounds.size.width, 20)];
            titleCurrentPage.textAlignment = NSTextAlignmentCenter;
            titleCurrentPage.text = currentPage.titlePage;
            titleCurrentPage.textColor = COLOR_LABEL;
            [childView addSubview:titleCurrentPage];
        }
        else if (currentPage.imagePage != nil) {
            UIImageView *currentImagePage = [[UIImageView alloc] initWithImage:currentPage.imagePage];
            currentImagePage.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - currentPage.imagePage.size.width / 2,
                                                20 - currentPage.imagePage.size.height / 2, currentPage.imagePage.size.width,
                                                currentPage.imagePage.size.height);
            [childView addSubview:currentImagePage];
        }
        [_menuBar addSubview:childView];
        index += 1;
    }
    [self.view addSubview:_menuBar];
}

- (void) initScrollPageView {
    pageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width,
                                                                [UIScreen mainScreen].bounds.size.height)];
    
    pageScroll.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * [controllers count],
                                        [UIScreen mainScreen].bounds.size.height);
    pageScroll.pagingEnabled = YES;

    NSInteger index = 0;
    for (UIViewController *currentController in controllers) {
        currentController.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * index,
                                                  0, currentController.view.frame.size.width,
                                                  currentController.view.frame.size.height - 64);
        [pageScroll addSubview:currentController.view];
        index += 1;
    }
    [self.view addSubview:pageScroll];
}

- (instancetype) initWithControllers:(NSArray *)_controllers {
    if (self = [super init]) {
        controllers = _controllers;
        _menuBar = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,
                                                                  [UIScreen mainScreen].bounds.size.width, 64)];
        _menuBar.backgroundColor = [UIColor whiteColor];
        _clickScroll = YES;
    }
    return (self);
}

@end

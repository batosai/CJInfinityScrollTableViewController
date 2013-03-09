//
//  CJInfinityTableViewController.h
//  CJInfinityScroll
//
//  Created by Jeremy on 30/07/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 @warning
    - Optional extend PullRefreshTableViewController, add PullRefreshTableViewController librarie in project and add `#define _CJINFINITYSCROLL_PULLREFRESH` to the header prefix of the project (`Prefix.pch`).
    - In order for network reachability to be monitored, include the `QuartzCore` framework in the active target's "Link Binary With Library" build phase
 */
#ifdef _CJINFINITYSCROLL_PULLREFRESH

#import "PullRefreshTableViewController.h"

@interface CJInfinityScrollTableViewController : PullRefreshTableViewController <UIScrollViewDelegate> {
#else
@interface CJInfinityScrollTableViewController : UITableViewController <UIScrollViewDelegate> {
#endif
    NSMutableArray *rows;
    NSUInteger offset;
    NSUInteger limit;
    NSUInteger totalRowsCount;
}

- (void)reload:(id)sender;
- (void)refresh;
- (void)beginLoading;
- (void)endLoading;

- (UIView*)viewLoading;
- (void)setVisibilityLoadingView:(BOOL)visibility;
- (BOOL)getVisibilityLoadingView;

@end

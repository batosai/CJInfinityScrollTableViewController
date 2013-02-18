//
//  CJInfinityTableViewController.h
//  CJInfinityScroll
//
//  Created by Jeremy on 30/07/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJInfinityScrollTableViewController : UITableViewController <UIScrollViewDelegate> {
    NSMutableArray *rows;
    NSUInteger offset;
    NSUInteger limit;
    NSUInteger totalRowsCount;
}

- (void)reload:(id)sender;
- (void)refresh;
- (void)startLoading;
- (void)stopLoading;

- (UIView*)viewLoading;
- (void)setVisibilityLoadingView:(BOOL)visibility;
- (BOOL)getVisibilityLoadingView;

@end

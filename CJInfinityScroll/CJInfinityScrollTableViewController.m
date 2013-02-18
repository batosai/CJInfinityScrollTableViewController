//
//  CJInfinityTableViewController.m
//  CJInfinityScroll
//
//  Created by Jeremy on 30/07/12.
//  Copyright (c) 2012 Jérémy Chaufourier. All rights reserved.
//

#import "CJInfinityScrollTableViewController.h"

#define ROWS_WITH_PAGE  20

@interface CJInfinityScrollTableViewController () {
    BOOL isLoadingRows;

    UIView *loadingView;
    UIActivityIndicatorView *indicatorView;
    UILabel *textlabel;
}

@end

@implementation CJInfinityScrollTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        limit = ROWS_WITH_PAGE;
        totalRowsCount = 0;
        isLoadingRows = NO;

        rows = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    loadingView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) + 50, CGRectGetWidth(self.view.frame), 50)];
    loadingView.hidden = YES;

    [loadingView addSubview:[self viewLoading]];
    [self.view addSubview:loadingView];
}

- (void)reload:(id)sender {
}

- (void)refresh {
    offset = 0;

    limit = [rows count] > ROWS_WITH_PAGE ? [rows count] : ROWS_WITH_PAGE;

    [self reload:@"refresh"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rows count];
}

- (UIView*)viewLoading
{
    CGRect frame;
    frame = loadingView.frame;
    frame.origin.y = 0;


    UIView *view = [[UIView alloc]initWithFrame:frame];

    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    frame = indicatorView.frame;
    frame.origin.x = 15;
    frame.origin.y = CGRectGetHeight(view.frame)/2 - CGRectGetHeight(frame)/2;
    indicatorView.frame = frame;

    textlabel = [[UILabel alloc] init];
    textlabel.font = [UIFont boldSystemFontOfSize:12];
    textlabel.textColor = [UIColor grayColor];
    textlabel.backgroundColor = [UIColor clearColor];
    textlabel.text = NSLocalizedString(@"Loading...", @"Loading...");
    textlabel.frame = CGRectMake(50, CGRectGetHeight(view.frame)/2 - CGRectGetHeight(frame)/2, CGRectGetWidth(view.frame) - 50, 20);

    [view addSubview: indicatorView];
    [view addSubview: textlabel];

    return view;
}

- (void)startLoading
{
    [indicatorView startAnimating];
    loadingView.hidden = NO;
    isLoadingRows = YES;

    offset = [rows count];
    limit = ROWS_WITH_PAGE;
}

- (void)stopLoading
{
    [indicatorView stopAnimating];
    loadingView.hidden = YES;
    isLoadingRows = NO;
    
    [self.tableView reloadData];
}

- (void)setVisibilityLoadingView:(BOOL)visible {
    
    if (![self getVisibilityLoadingView]) {
        CGRect frame = loadingView.frame;
        frame.origin.y = self.tableView.contentSize.height;
        loadingView.frame = frame;
        
        CGSize size = self.tableView.contentSize;
        size.height += 50;
        self.tableView.contentSize = size;
    }
    
    loadingView.hidden = !visible;
}

- (BOOL)getVisibilityLoadingView {
    return !loadingView.hidden;
}

#pragma mark - Delegate

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{    
    if (!isLoadingRows &&
        scrollView.contentOffset.y >= (scrollView.contentSize.height - CGRectGetHeight(self.view.frame))){
        
        CGRect frame = loadingView.frame;
        frame.origin.y = scrollView.contentSize.height;
        loadingView.frame = frame;
        
        
        CGSize size = scrollView.contentSize;
        size.height += 50;
        scrollView.contentSize = size;
        
        [self startLoading];
        [self reload:nil];
    }
}

@end

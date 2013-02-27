//
//  CJTableViewController.m
//  CJInfinityScroll
//
//  Created by Jeremy on 13/02/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJClassicTableViewController.h"

@interface CJClassicTableViewController () {
    NSMutableArray *rows2;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) UINavigationController *navigationController;

@end

@implementation CJClassicTableViewController

@synthesize navigationController = _navigationController;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"classic";
        [rows addObjectsFromArray: @[
                  @"item 1",
                  @"item 2",
                  @"item 3",
                  @"item 4",
                  @"item 5",
                  @"item 6",
                  @"item 7",
                  @"item 8",
                  @"item 9",
                  @"item 10",
                  @"item 11",
                  @"item 12",
                  @"item 13",
                  @"item 14",
                  @"item 15",
                  @"item 16",
                  @"item 17",
                  @"item 18",
                  @"item 19",
                  @"item 20",]
         ];
        
        rows2 = NSMutableArray.new;
        [rows2 addObjectsFromArray: @[
         @"item 21",
         @"item 22",
         @"item 23",
         @"item 24",
         @"item 25",
         @"item 26",
         @"item 27",
         @"item 28",
         @"item 29",
         @"item 30",
         @"item 31",
         @"item 32",
         @"item 33",
         @"item 34",
         @"item 35",
         @"item 36",
         @"item 37",
         @"item 38",
         @"item 39",
         @"item 40"]
         ];
    }

    return self;
}

- (UINavigationController *)navigationController {
    if (navigationController == nil) {
        navigationController = [[UINavigationController alloc] initWithRootViewController:self];
        self.navigationController = navigationController;
    }
    
    return navigationController;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [rows objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark surcharge CJInfinityScroll method

- (void)reload:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(loading:) userInfo:nil repeats:NO];
}

- (void)loading:(NSTimer*)timer  {
    [rows addObjectsFromArray:rows2];
    
    [self stopLoading];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([rows count] != 40){
        [super scrollViewDidScroll:scrollView];
    }
}

@end

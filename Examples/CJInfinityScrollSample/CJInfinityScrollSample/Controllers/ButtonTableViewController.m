//
//  CJButtonTableViewController.m
//  CJInfinityScroll
//
//  Created by Jeremy on 17/02/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "ButtonTableViewController.h"

#import "AFClient.h"

@interface ButtonTableViewController () {
    AFClient *client;
    UINavigationController *navigationController;
    
    NSMutableDictionary *parameters;
    
    UIView *view;
    UIButton *button;
    UIImageView *animationView;
}

@property (nonatomic, retain) UINavigationController *navigationController;

@end

@implementation ButtonTableViewController

@synthesize navigationController = _navigationController;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"View Button";
        limit = 20;

        client = [[AFClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.chaufourier.fr/api/"]];

        UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                    target:self
                                                                                    action:@selector(refresh)];

        self.navigationItem.rightBarButtonItem = refreshButton;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self reload:nil];
}

- (UINavigationController *)navigationController {
    if (navigationController == nil) {
        navigationController = [[UINavigationController alloc] initWithRootViewController:self];
        self.navigationController = navigationController;
    }

    return navigationController;
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

    cell.textLabel.text = [[rows objectAtIndex:indexPath.row] objectForKey:@"label"];

    return cell;
}

#pragma delegate button

- (void)onStartPressed {
    button.hidden = YES;
    animationView.hidden = NO;
    [animationView startAnimating];

    [self reload:nil];
}

#pragma mark surcharge CJInfinityScroll method

- (void)reload:(id)sender {
    [self beginLoading];
    
    if ([sender isEqualToString:@"refresh"]) {
        parameters = [NSMutableDictionary dictionaryWithDictionary:@{
                      @"limit" : [NSNumber numberWithInt:[rows count]],
                      @"offset" : [NSNumber numberWithInt:0]
                      }];
        [rows removeAllObjects];
    }
    else {
        parameters = [NSMutableDictionary dictionaryWithDictionary:@{
                      @"limit" : [NSNumber numberWithInt:limit],
                      @"offset" : [NSNumber numberWithInt:offset]
                      }];
    }

    [client getPath:@"items.php" parameters:parameters success:^(AFHTTPRequestOperation *operation, id JSON) {

        NSArray *response = [JSON valueForKeyPath:@"items"];
        totalRowsCount = [[JSON valueForKeyPath:@"total_count"] integerValue];

        [rows addObjectsFromArray:response];
        
        [self stopLoading];
    } failure:nil];
}

- (UIView*)viewLoading {
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 50);
    [button setTitle:@"Load next items" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onStartPressed) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *animationArray=[NSArray arrayWithObjects:
                             [UIImage imageNamed:@"loader-1"],
                             [UIImage imageNamed:@"loader-2"],
                             [UIImage imageNamed:@"loader-3"],
                             [UIImage imageNamed:@"loader-4"],
                             nil];
    
    animationView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 - 20, 18, 43, 11)];
    animationView.animationImages = animationArray;
    animationView.animationDuration = .5;
    animationView.animationRepeatCount = 0;

    view = [[UIView alloc]initWithFrame:button.frame];
    [view addSubview:animationView];

    [view addSubview:button];

    return view;
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    /*
     * Load automatic,
     * Add this implementation with code
    if ([rows count] < totalRowsCount){
        [super scrollViewDidScroll:scrollView];
    }*/
    if ([rows count] < totalRowsCount){
        [self setVisibilityLoadingView:YES];
    }
}

- (void) stopLoading {
    [super endLoading];

    [animationView stopAnimating];
    button.hidden = NO;
    animationView.hidden = YES;
}


@end

//
//  CJAFNetworkingTableViewController.m
//  CJInfinityScroll
//
//  Created by Jeremy on 13/02/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "AFNetworkingTableViewController.h"

#import "AFClient.h"

@interface AFNetworkingTableViewController () {
    UINavigationController *navigationController;
    
    NSMutableDictionary *parameters;
}

@property (nonatomic, retain) UINavigationController *navigationController;

@end

@implementation AFNetworkingTableViewController

@synthesize navigationController = _navigationController;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"AFNetworking";

        parameters = [NSMutableDictionary dictionaryWithDictionary:@{@"q" : @"ondar", @"include_entities" : @"true", @"result_type" : @"mixed", @"rpp" : [NSNumber numberWithInt:20]}];
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
    
    cell.textLabel.text = [[rows objectAtIndex:indexPath.row] objectForKey:@"from_user"];

    return cell;
}


#pragma mark surcharge CJInfinityScroll method

- (void)reload:(id)sender {
    [self beginLoading];

    [[AFClient sharedClient] getPath:@"search.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSArray *response = [JSON valueForKeyPath:@"results"];

        [rows addObjectsFromArray:response];

        if([JSON valueForKeyPath:@"next_page"]) {
            [parameters setValue:
                [NSNumber numberWithInt:[[JSON valueForKeyPath:@"page"] integerValue]+1]
                          forKey:@"page"];
        }
        else {
            parameters = nil;
        }

        [self endLoading];
    } failure:nil];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (parameters != nil){
        [super scrollViewDidScroll:scrollView];
    }
}

@end

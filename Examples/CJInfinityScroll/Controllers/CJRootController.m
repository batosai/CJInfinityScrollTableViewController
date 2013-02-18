//
//  CJRootController.m
//  CJInfinityScroll
//
//  Created by Jeremy on 13/02/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CJRootController.h"

#import "CJClassicTableViewController.h"
#import "CJCustomTableViewController.h"
#import "CJAFNetworkingTableViewController.h"
#import "CJButtonTableViewController.h"

@interface CJRootController ()

@end

@implementation CJRootController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        CJClassicTableViewController *classicTableViewController = [[CJClassicTableViewController alloc] init];
        CJCustomTableViewController *customTableViewController = [[CJCustomTableViewController alloc] init];
        CJAFNetworkingTableViewController *afnetworkingTableViewController = [[CJAFNetworkingTableViewController alloc] init];
        CJButtonTableViewController *buttonTableViewController = [[CJButtonTableViewController alloc] init];

        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:classicTableViewController.title image:nil tag:1];
        UITabBarItem *tabItem2 = [[UITabBarItem alloc] initWithTitle:customTableViewController.title image:nil tag:2];
        UITabBarItem *tabItem3 = [[UITabBarItem alloc] initWithTitle:afnetworkingTableViewController.title image:nil tag:3];
        UITabBarItem *tabItem4 = [[UITabBarItem alloc] initWithTitle:buttonTableViewController.title image:nil tag:4];

        classicTableViewController.tabBarItem = tabItem;
        customTableViewController.tabBarItem = tabItem2;
        afnetworkingTableViewController.tabBarItem = tabItem3;
        buttonTableViewController.tabBarItem = tabItem4;

        self.viewControllers = [NSArray arrayWithObjects:
                                    classicTableViewController.navigationController,
                                    customTableViewController.navigationController,
                                    afnetworkingTableViewController.navigationController,
                                    buttonTableViewController.navigationController,
                                nil];
    }
    return self;
}

@end

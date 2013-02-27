//
//  CJRootController.m
//  CJInfinityScroll
//
//  Created by Jeremy on 13/02/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "RootController.h"

#import "ClassicTableViewController.h"
#import "CustomTableViewController.h"
#import "AFNetworkingTableViewController.h"
#import "ButtonTableViewController.h"

@interface RootController ()

@end

@implementation RootController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        ClassicTableViewController *classicTableViewController = [[ClassicTableViewController alloc] init];
        CustomTableViewController *customTableViewController = [[CustomTableViewController alloc] init];
        AFNetworkingTableViewController *afnetworkingTableViewController = [[AFNetworkingTableViewController alloc] init];
        ButtonTableViewController *buttonTableViewController = [[ButtonTableViewController alloc] init];

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

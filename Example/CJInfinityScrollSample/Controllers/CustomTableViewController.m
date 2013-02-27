//
//  CJCustomTableViewController.m
//  CJInfinityScroll
//
//  Created by Jeremy on 13/02/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import "CustomTableViewController.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"custom";
    }
    
    return self;
}


#pragma mark surcharge CJInfinityScroll method

- (UIView*)viewLoading {
    NSArray *animationArray=[NSArray arrayWithObjects:
                             [UIImage imageNamed:@"loader-1"],
                             [UIImage imageNamed:@"loader-2"],
                             [UIImage imageNamed:@"loader-3"],
                             [UIImage imageNamed:@"loader-4"],
                             nil];
    
    UIImageView *animationView=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 - 20, 18, 43, 11)];
    animationView.animationImages = animationArray;
    animationView.animationDuration = .5;
    animationView.animationRepeatCount = 0;
    
    [animationView startAnimating];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 43, 11)];
    [view addSubview:animationView];
    
    return view;
}

@end

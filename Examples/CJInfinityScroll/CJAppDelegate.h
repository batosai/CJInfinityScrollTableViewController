//
//  CJAppDelegate.h
//  CJInfinityScroll
//
//  Created by Jeremy on 13/02/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJRootController;

@interface CJAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) CJRootController *viewController;

@end

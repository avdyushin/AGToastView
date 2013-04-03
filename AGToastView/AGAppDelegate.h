//
//  AGAppDelegate.h
//  AGToastView
//
//  Created by Grigory Avdyushin on 4/1/13.
//  Copyright (c) 2013 Grigory Avdyushin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGViewController;

@interface AGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AGViewController *viewController;

@end

//
//  AppDelegate.h
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse.h"
#import <PubNub/PNImports.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate, PNDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) PubNub *pubNub;

@end


//
//  CCAnimationProvider.m
//  iChat
//
//  Created by admin on 1/28/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "CCAnimationProvider.h"

@implementation CCAnimationProvider

#define kOFFSET_FOR_KEYBOARD 150.0

+(void)setView:(UIView *)currentView movedUp:(BOOL)movedUp {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = currentView.frame;
    if (movedUp) {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else {
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    currentView.frame = rect;
    
    [UIView commitAnimations];
}

@end

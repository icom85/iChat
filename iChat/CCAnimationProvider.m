//
//  CCAnimationProvider.m
//  iChat
//
//  Created by admin on 1/28/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "CCAnimationProvider.h"

@implementation CCAnimationProvider

+(void)setView:(UIView *)currentView movedUp:(BOOL)movedUp withOffset:(int) offset {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = currentView.frame;
    if (movedUp) {
        rect.origin.y -= offset;
        rect.size.height += offset;
    }
    else {
        rect.origin.y += offset;
        rect.size.height -= offset;
    }
    currentView.frame = rect;
    
    [UIView commitAnimations];
}

@end

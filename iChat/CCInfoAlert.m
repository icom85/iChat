//
//  CCInfoAlert.m
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "CCInfoAlert.h"

@implementation CCInfoAlert{
    UIAlertView *alert;
}

+(void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: title
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles:nil,
                          nil];
    [alert show];
}

@end

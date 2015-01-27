//
//  CCParseData.m
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "CCParseData.h"

@implementation CCParseData

+ (void)logInWithBlock:(NSString *)username
              password:(NSString *)password
                block :(void (^)(PFUser *user, NSError *error))block{
    [PFUser logInWithUsernameInBackground:username
                                 password:password
                                    block:block];
}

+ (void)signUplWithBlock:(PFUser *)user
                  block :(void (^)(BOOL succeeded, NSError *error))block{
    [user signUpInBackgroundWithBlock: block];
}

+ (void)requestPasswordResetlWithBlock:(NSString *)email
                                block :(void (^)(BOOL succeeded, NSError *error))block{
    [PFUser requestPasswordResetForEmailInBackground:email
                                               block:block];
}

@end

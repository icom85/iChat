//
//  CCParseData.h
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parse.h"

@interface CCParseData : NSObject

+ (void)logInWithBlock:(NSString *)username
              password:(NSString *)password
                block :(void (^)(PFUser *user, NSError *error))block;

+ (void)signUplWithBlock:(PFUser *)user
                  block :(void (^)(BOOL succeeded, NSError *error))block;

+ (void)requestPasswordResetlWithBlock:(NSString *)email
                                block :(void (^)(BOOL succeeded, NSError *error))block;

@end

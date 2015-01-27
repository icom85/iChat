//
//  CCInputValidator.h
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCInputValidator : NSObject

+(Boolean)validateInputAsText: (NSString *) input;

+(Boolean)validateInputAsEmail: (NSString *) input;

+(Boolean)validateInputAsPassword: (NSString *) input;

+(Boolean)validateInputAsRepeatedPassword: (NSString *) input : (NSString *) repeatedPassword;

@end

//
//  CCInputValidator.m
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "CCInputValidator.h"

@implementation CCInputValidator
+(Boolean)validateInputAsText:(NSString *)input {
    if (input.length == 0) {
        return NO;
    }
    
    return YES;
};

+(Boolean)validateInputAsEmail:(NSString *)email {
    if (email.length == 0 || ![email containsString:@"@"]) {
        return NO;
    }
    
    return YES;
};

+(Boolean)validateInputAsPassword:(NSString *)password {
    if (password.length < 6) {
        return NO;
    }
    
    return YES;
};

+(Boolean)validateInputAsRepeatedPassword:(NSString *)password : (NSString *)repeatedPassword{
    if (![password isEqualToString: repeatedPassword]) {
        return NO;
    }
    
    return YES;
};

@end

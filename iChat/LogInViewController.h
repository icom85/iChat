//
//  LogInViewController.h
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCInputValidator.h"
#import "CCParseData.h"
#import "CCInfoAlert.h"

@interface LogInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameInput;

@property (weak, nonatomic) IBOutlet UITextField *passwordInput;

- (IBAction)onLogInClick:(id)sender;

- (IBAction)onForgotClick:(id)sender;

@end

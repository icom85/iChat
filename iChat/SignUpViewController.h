//
//  SignUpViewController.h
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCInputValidator.h"
#import "CCParseData.h"
#import "CCInfoAlert.h"

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameInput;

@property (weak, nonatomic) IBOutlet UITextField *lastNameInput;

@property (weak, nonatomic) IBOutlet UITextField *usernameInput;

@property (weak, nonatomic) IBOutlet UITextField *emailInput;

@property (weak, nonatomic) IBOutlet UITextField *passwordInput;

@property (weak, nonatomic) IBOutlet UITextField *repeatPasswordInput;

- (IBAction)onSignUpClick:(id)sender;

@end

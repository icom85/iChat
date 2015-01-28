//
//  SignUpViewController.m
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.passwordInput.delegate = self;
    self.emailInput.delegate = self;
    self.repeatPasswordInput.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

-(void)textFieldDidBeginEditing:(UITextField *)sender {
    if ([sender isEqual: self.emailInput] || [sender isEqual: self.passwordInput] || [sender isEqual: self.repeatPasswordInput]) {
        if  (self.view.frame.origin.y >= 0) {
            [CCAnimationProvider setView:self.view movedUp:YES];
        }
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField isEqual: self.emailInput] || [textField isEqual: self.passwordInput] || [textField isEqual: self.repeatPasswordInput]) {
        [CCAnimationProvider setView:self.view movedUp:NO];
    }
}

- (IBAction)onSignUpClick:(id)sender {
    NSString *firstName = self.firstNameInput.text;
    if (![CCInputValidator validateInputAsText:firstName]) {
        [CCInfoAlert showAlertWithTitle:@"Error"
                      andMessage: @"first name cannot be empty"];
        
        return;
    }
    
    NSString *lastName = self.lastNameInput.text;
    if (![CCInputValidator validateInputAsText:lastName]) {
        [CCInfoAlert showAlertWithTitle:@"Error"
                      andMessage: @"last name cannot be empty"];
        return;
    }
    
    NSString *username = self.usernameInput.text;
    if (![CCInputValidator validateInputAsText:username]) {
        [CCInfoAlert showAlertWithTitle:@"Error"
                      andMessage: @"username cannot be empty"];
        return;
    }
    
    NSString *email = self.emailInput.text;
    if (![CCInputValidator validateInputAsEmail:email]) {
        [CCInfoAlert showAlertWithTitle:@"Error"
                      andMessage: @"invalid e-mail input"];
        return;
    }
    
    NSString *password = self.passwordInput.text;
    if (![CCInputValidator validateInputAsPassword:password]) {
        [CCInfoAlert showAlertWithTitle:@"Error"
                      andMessage:@"password needs to be at least 6 characters long"];
        return;
    }
    
    NSString *repeatedPassword = self.repeatPasswordInput.text;
    if (![CCInputValidator validateInputAsRepeatedPassword:password:repeatedPassword]) {
        [CCInfoAlert showAlertWithTitle:@"Error"
                      andMessage: @"password and repeated password do not match"];
        return;
    }
    
    PFUser *user = [PFUser user];
    user.username = username;
    user.password = password;
    user.email = email;
    user[@"firstName"] = firstName;
    user[@"lastName"] = lastName;
    
    __weak typeof(self) weakSelf = self;
    [CCParseData signUplWithBlock:user
                            block: ^(BOOL succeeded, NSError *error) {
                                if (!error) {
                                    UIAlertView *successSignUp = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                            message:@"You have successfully registered"
                                                                                           delegate:weakSelf
                                                                                  cancelButtonTitle:@"Ok"
                                                                                  otherButtonTitles:nil,
                                                                  nil];
                                    successSignUp.tag = 1;
                                    [successSignUp show];
                                } else {
                                    NSString *errorString = [error userInfo][@"error"];
                                    [CCInfoAlert showAlertWithTitle:@"Error"
                                                      andMessage: errorString];
                                    
                                }
                            }];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        [self performSegueWithIdentifier:@"showMainViewFromSignUp" sender:self];
    }
}

@end

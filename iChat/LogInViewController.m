//
//  LogInViewController.m
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

- (IBAction)onLogInClick:(id)sender {
    NSString *username = self.usernameInput.text;
    if (![CCInputValidator validateInputAsText:username]) {
        [CCInfoAlert showAlertWithTitle: @"Error"
                      andMessage: @"username name cannot be empty"];
        
        return;
    }
    
    NSString *password = self.passwordInput.text;
    if (![CCInputValidator validateInputAsPassword:password]) {
        [CCInfoAlert showAlertWithTitle: @"Error"
                      andMessage: @"password needs to be at least 6 characters long"];
        
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    [CCParseData logInWithBlock:username
                       password:password
                          block:^(PFUser *user, NSError *error) {
                              if (!error) {
                                  weakSelf.usernameInput.text = @"";
                                  weakSelf.passwordInput.text = @"";
                                  [weakSelf performSegueWithIdentifier:@"showMainView"
                                                                sender:self];
                              } else {
                                  [CCInfoAlert showAlertWithTitle: @"Error"
                                                    andMessage:[error userInfo][@"error"]];
                              }
                          }];

}

- (IBAction)onForgotClick:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter email" message:@"Please enter the email for your account" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil] ;
    alertView.tag = 1;
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1 && alertView.tag == 1) {
        UITextField *emailTextField = [alertView textFieldAtIndex:0];
        NSString *email = emailTextField.text;
        if (![CCInputValidator validateInputAsEmail:email]) {
            [CCInfoAlert showAlertWithTitle: @"Error"
                          andMessage:@"invalid e-mail input"];
            
            return;
        }
        
        [CCParseData requestPasswordResetlWithBlock:email
                                                         block:^(BOOL succeeded, NSError *error) {
                                                             if (!error) {
                                                                 [CCInfoAlert showAlertWithTitle:@"Password Reset"
                                                                                   andMessage:[NSString stringWithFormat:@"An email with reset instructions has been sent to %@", email]];
                                                             } else {
                                                                 [CCInfoAlert showAlertWithTitle: @"Error"
                                                                                   andMessage: [error userInfo][@"error"]];
                                                             }
                                                         }];
    }
}

@end

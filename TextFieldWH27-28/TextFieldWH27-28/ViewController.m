//
//  ViewController.m
//  TextFieldWH27-28
//
//  Created by Nikolay Berlioz on 06.12.15.
//  Copyright © 2015 Nikolay Berlioz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextFieldDelegate


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.firstNameField])
    {
        [self.lastNameField becomeFirstResponder];
    }
    
    if ([textField isEqual:self.lastNameField])
    {
        [self.loginField becomeFirstResponder];
    }
    
    if ([textField isEqual:self.loginField])
    {
        [self.passwordField becomeFirstResponder];
    }
    
    if ([textField isEqual:self.passwordField])
    {
        [self.phoneNumberField becomeFirstResponder];
    }
    
    if ([textField isEqual:self.phoneNumberField])
    {
        [self.emailField becomeFirstResponder];
    }
    
    if ([textField isEqual:self.emailField])
    {
        [textField resignFirstResponder];
    }

    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *resultString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([textField isEqual:self.firstNameField])
    {
        self.firstNameLabel.text = resultString;
    }
    
    if ([textField isEqual:self.lastNameField])
    {
        self.lastNameLabel.text = resultString;
    }
    
    if ([textField isEqual:self.loginField])
    {
        self.loginLabel.text = resultString;
    }
    
    if ([textField isEqual:self.passwordField])
    {
        self.passwordLabel.text = resultString;
    }
    
    if ([textField isEqual:self.phoneNumberField])
    {
        self.phoneNumberLabel.text = resultString;
    }
    
    if ([textField isEqual:self.emailField])
    {
        self.emailLabel.text = resultString;
    }
    
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if ([textField isEqual:self.firstNameField])
    {
        self.firstNameLabel.text = @"";
    }
    
    if ([textField isEqual:self.lastNameField])
    {
        self.lastNameLabel.text = @"";
    }
    
    if ([textField isEqual:self.loginField])
    {
        self.loginLabel.text = @"";
    }
    
    if ([textField isEqual:self.passwordField])
    {
        self.passwordLabel.text = @"";
    }
    
    if ([textField isEqual:self.phoneNumberField])
    {
        self.phoneNumberLabel.text = @"";
    }
    
    if ([textField isEqual:self.emailField])
    {
        self.emailLabel.text = @"";
    }

    
    return YES;
}


@end











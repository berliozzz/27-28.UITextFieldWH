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
        NSCharacterSet *validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        NSArray *components = [string componentsSeparatedByCharactersInSet:validationSet];
        
        if ([components count] > 1)
        {
            return NO;
        }
        
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        NSArray *validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
        
        newString = [validComponents componentsJoinedByString:@""];
        
        static const int localNumberMaxLenght = 7;
        static const int areaCodeMaxLenght = 3;
        static const int countryCodeMaxLenght = 1;
        
        if ([newString length] > localNumberMaxLenght + areaCodeMaxLenght + countryCodeMaxLenght)
        {
            return NO;
        }
        
        NSMutableString *phoneNumberString = [NSMutableString string];
        
        NSInteger localNumberLenght = MIN([newString length], localNumberMaxLenght);
        
        //local number
        if (localNumberLenght > 0)
        {
            NSString *number = [newString substringFromIndex:(int)[newString length] - localNumberLenght];
            
            [phoneNumberString appendString:number];
            
            if ([phoneNumberString length] > 3)
            {
                [phoneNumberString insertString:@"-" atIndex:3];
            }
        }
        //area code number
        if ([newString length] > localNumberMaxLenght)
        {
            NSInteger areaCodeLenght = MIN((int)[newString length] - localNumberMaxLenght, areaCodeMaxLenght);
            
            NSRange areaRange = NSMakeRange((int)[newString length] - localNumberMaxLenght - areaCodeLenght, areaCodeLenght);
            
            NSString *area = [newString substringWithRange:areaRange];
            
            area = [NSString stringWithFormat:@"(%@) ", area];
            
            [phoneNumberString insertString:area atIndex:0];
        }
        //country code  number
        if ([newString length] > localNumberMaxLenght + areaCodeMaxLenght)
        {
            NSInteger countryCodeLenght = MIN((int)[newString length] - localNumberMaxLenght - areaCodeMaxLenght, countryCodeMaxLenght);
            
            NSRange countryCodeRange = NSMakeRange(0, countryCodeLenght);
            
            NSString *countryCode = [newString substringWithRange:countryCodeRange];
            
            countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
            
            [phoneNumberString insertString:countryCode atIndex:0];
        }
        
        textField.text = phoneNumberString;
        self.phoneNumberLabel.text = phoneNumberString;
        
        return NO;
    }
    
    if ([textField isEqual:self.emailField])
    {
        NSString *emailString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        NSCharacterSet *setCheck = [NSCharacterSet characterSetWithCharactersInString:@"@"];
        
        NSArray *components = [emailString componentsSeparatedByCharactersInSet:setCheck];
        
        if ([components count] > 2)
        {
            return NO;
        }
        
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











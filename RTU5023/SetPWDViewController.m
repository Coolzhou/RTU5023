//
//  SetPWDViewController.m
//  k3
//
//  Created by amttgroup on 16/2/17.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "SetPWDViewController.h"
#import "AppDelegate.h"
#import "Unitl.h"

@interface SetPWDViewController (){
    NSString *pwd, *oldpwd;
    int time;
    NSTimer *timer;
}

@end

@implementation SetPWDViewController
AppDelegate *setPWD_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    setPWD_app = [[UIApplication sharedApplication] delegate];
    time = 0;
    if (setPWD_app.isEntry) {
        [self.navigationItem.backBarButtonItem setTitle:@""];
        [self.navigationItem setHidesBackButton:YES];
    }
    
    _set_pwdTitleL.text = NSLocalizedString(@"setPWDTitleL", nil);
    [_set_pwdText1 becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *t = textField.text;
    int tag = (int)textField.tag;
    
    if (t.length >=1) {
        switch (tag) {
            case 1:
                [_set_pwdText2 becomeFirstResponder];
                break;
            case 2:
                [_set_pwdText3 becomeFirstResponder];
                break;
            case 3:
                [_set_pwdText4 becomeFirstResponder];
                timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(hiden) userInfo:nil repeats:NO];
                return YES;
            case 4:
                return NO;
                break;
                
            default:
                break;
        }
    }
    return YES;
}

-(void)hiden {
    [timer invalidate];
    timer = nil;
    [_set_pwdText4 resignFirstResponder];
    pwd = [NSString stringWithFormat:@"%@%@%@%@", _set_pwdText1.text, _set_pwdText2.text, _set_pwdText3.text, _set_pwdText4.text];
    if (setPWD_app.isEntry) {
        if ([pwd isEqualToString:setPWD_app.appPWD]) {
            [self.navigationController  popViewControllerAnimated:YES];
        }else{
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"setPWDTip2", nil) preferredStyle:UIAlertControllerStyleAlert];
            [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self oneMoreTime];
            }]];
            [self presentViewController:ac animated:YES completion:nil];
        }
    }else{
        if (setPWD_app.isCloseAppPWD) {
            if ([pwd isEqualToString:setPWD_app.appPWD]) {
                Unitl *u = [Unitl new];
                BOOL b = [u setAPPPWD:@"" isSet:NO];
                if (b) {
                    setPWD_app.isSetAppPwd = NO;
                }
                [self.navigationController  popViewControllerAnimated:YES];
            }else{
                UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"setPWDTip2", nil) preferredStyle:UIAlertControllerStyleAlert];
                [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                     [self oneMoreTime];
                }]];
                [self presentViewController:ac animated:YES completion:nil];
            }
            
        }else{
            time++;
            if (time > 1) {
                if ([pwd isEqualToString:oldpwd]) {
                    Unitl *u = [Unitl new];
                    BOOL b = [u setAPPPWD:pwd isSet:YES];
                    if (b) {
                        setPWD_app.isSetAppPwd = YES;
                        setPWD_app.appPWD = pwd;
                        [self.navigationController  popViewControllerAnimated:YES];
                    }else{
                        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"setPWDTip", nil) preferredStyle:UIAlertControllerStyleAlert];
                        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            [self.navigationController  popViewControllerAnimated:YES];
                        }]];
                        [self presentViewController:ac animated:YES completion:nil];
                    }
                }else{
                    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"setPWDTip3", nil) preferredStyle:UIAlertControllerStyleAlert];
                    [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        _set_pwdTitleL.text = NSLocalizedString(@"setPWDTitleL", nil);
                        [self oneMoreTime];
                    }]];
                    [self presentViewController:ac animated:YES completion:nil];
                }
                
            }else{
                oldpwd = pwd;
                pwd = @"";
                _set_pwdTitleL.text = NSLocalizedString(@"setPWDTitleL2", nil);
                [self oneMoreTime];
            }
        }
    }
}

-(void)oneMoreTime{
    _set_pwdText1.text = @"";
    _set_pwdText2.text = @"";
    _set_pwdText3.text = @"";
    _set_pwdText4.text = @"";
    [_set_pwdText1 becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    setPWD_app.isEntry = YES;
}


@end

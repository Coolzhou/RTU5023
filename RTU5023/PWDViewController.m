//
//  PWDViewController.m
//  S275
//
//  Created by paul on 16/3/20.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "PWDViewController.h"
#import "AppDelegate.h"
#import "Unitl.h"

@interface PWDViewController (){
    Unitl *u;
}

@end

@implementation PWDViewController
AppDelegate *pwd_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tag = 1;
    pwd_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = pwd_app.bgColor;
    u = [[Unitl alloc] init];
    
    [[_pwd_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_pwd_bgV layer] setBorderColor: pwd_app.borderColor.CGColor];//颜色
    [[_pwd_bgV layer]setCornerRadius:15.0];//圆角
    [[_pwd_bgV2 layer] setBorderWidth:1.5];//画线的宽度
    [[_pwd_bgV2 layer] setBorderColor: pwd_app.borderColor.CGColor];//颜色
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) {
        return YES;
    }
    
    if (textField.tag == 1 && textField.text.length >= 4) {
        return false;
    }

    return [self validateNumber:string];
}


- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)pwd_okClick:(id)sender {
    NSString *new = _pwd_newPT.text;
    NSString *old = _pwd_oldPT.text;
    NSString *msg = nil;
    if ( ![pwd_app.sel_host_pwd isEqualToString:old]) {
        msg = NSLocalizedString(@"pwdTip", nil);
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
        return;
    }
    if (new == nil || new.length != 4 || ![self validateNumber:new]) {
        msg = NSLocalizedString(@"pwdTip2", nil);
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
        return;
    }
    if([new isEqualToString:old]){
        msg = NSLocalizedString(@"pwdTip3", nil);
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
        return;
    }
    
    
    BOOL b = [u updateHostACName:pwd_app.sel_host_name hostPWD:new remarks:pwd_app.sel_host_remarks type:pwd_app.sel_host_type newPhNum:pwd_app.sel_host_phNum oldPhNum:pwd_app.sel_host_phNum];
    if (b) {
        NSString *msg = [NSString stringWithFormat:@"%@P%@", pwd_app.sel_host_pwd, new];
        [pwd_app.mainV sendMsg:msg phNum:pwd_app.sel_host_phNum];
        pwd_app.sel_host_pwd = new;
    }
    
    
}
@end

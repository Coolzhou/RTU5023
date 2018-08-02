//
//  AddViewController.m
//  k3
//
//  Created by amttgroup on 16/2/17.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "AddViewController.h"
#import "AppDelegate.h"
#import "Unitl.h"
#import "TypeNavigationController.h"

@interface AddViewController (){
    int editTextTag;
    BOOL isKeyShow;
}

@end

@implementation AddViewController
AppDelegate *add_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    add_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = add_app.bgColor;
    editTextTag = -1;
    isKeyShow = NO;
    [[_add_bgV layer] setBorderWidth:1.0];//画线的宽度
    [[_add_bgV layer] setBorderColor: add_app.borderColor.CGColor];//颜色
    [[_add_bgV layer]setCornerRadius:15.0];//圆角
    
    if (add_app.isAddHost) {
        _addTitleL.text = NSLocalizedString(@"addTitleL", nil);
        add_app.sel_host_type = @"RTU5023";
    }else{
        _addTitleL.text = NSLocalizedString(@"addTitleL2", nil);
        _add_hostNameText.text = add_app.sel_host_name;
        _add_hostNumText.text = add_app.sel_host_phNum;
        _add_hostPWDText.text = add_app.sel_host_pwd;
        _add_remarksText.text = add_app.sel_host_remarks;
    }
    _add_hostNameL.text = NSLocalizedString(@"addHostNameL", nil);
    _add_hostNumL.text = NSLocalizedString(@"addHostNumL", nil);
    _add_hostPWDL.text = NSLocalizedString(@"addHostPWDL", nil);
    _add_saveBtnL.text = NSLocalizedString(@"add_saveBtnL", nil);
    
    [_add_hostNameText setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    [_add_hostNameText setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addBtnClink:(id)sender {
    NSString *name = _add_hostNameText.text ;
    NSString *num = _add_hostNumText.text;
    NSString *pwd = _add_hostPWDText.text;
    NSString *remarks = _add_remarksText.text;
    if (name.length <= 0 || num.length <= 0 || pwd.length <= 0) {
        NSString *msg = add_app.isAddHost ? NSLocalizedString(@"addTip", nil) : NSLocalizedString(@"editTip", nil);
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
        return;
    }
    
    Unitl *u = [Unitl new];
    int b;
    if (add_app.isAddHost) {
        b = [u addHostACName:name hostNum:num hostPWD:pwd remarks:remarks type:add_app.sel_host_type];
    }else{
        b = [u updateHostACName:name hostPWD:pwd remarks:remarks type:add_app.sel_host_type  newPhNum:num  oldPhNum:add_app.sel_host_phNum];
    }
    if (b == 1) {
       
//        NSString * msg1 = [NSString stringWithFormat:@"%@L%@#", pwd, num];
//        [add_app.mainV sendMsg:msg1 phNum:num];
        
        
        NSString *msg = add_app.isAddHost ? NSLocalizedString(@"addTip2", nil) : NSLocalizedString(@"editTip2", nil);
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if(add_app.isAddHost){
                NSString * msg1 = [NSString stringWithFormat:@"%@TEL%@#", pwd, num];
                [add_app.mainV sendMsg:msg1 phNum:num];
            }
            [self.navigationController  popViewControllerAnimated:YES];
        }]];
        [self presentViewController:ac animated:YES completion:nil];

    }else{
        NSString *msg = @"";
        if (b == -1) {
            msg = NSLocalizedString(@"addTip3", nil);
        }else{
            msg = NSLocalizedString(@"addTip4", nil);
        }
        
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
    }
}

- (IBAction)selectTypeClick:(id)sender {
    
    TypeNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"add_type"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    editTextTag = (int)textField.tag;
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) {
        return YES;
    }
    if (textField.tag == 2) {
        if (textField.text.length >= 4) {
            return NO;
        }
    }
    if (textField.tag == 0) {
        if(add_app.langId == 0){
            if (textField.text.length >= 11) {
                return NO;
            }
        }else{
            if (textField.text.length >= 22) {
                return NO;
            }
        }
    }
    if (textField.tag == 3) {
        if(add_app.langId == 0){
            if (textField.text.length >= 16) {
                return NO;
            }
        }else{
            if (textField.text.length >= 28) {
                return NO;
            }
        }
    }
    if (textField.tag == 1 || textField.tag == 2 ) {
        return [self validateNumber:string];
    }
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField.tag == 0) {
        if(add_app.langId == 0){
            if (textField.text.length >= 11) {
                textField.text = [textField.text substringToIndex:11];
            }
        }else{
            if (textField.text.length >= 22) {
                textField.text = [textField.text substringToIndex:22];
            }
        }
    }
    if (textField.tag == 3) {
        if(add_app.langId == 0){
            if (textField.text.length >= 16) {
                textField.text = [textField.text substringToIndex:16];
            }
        }else{
            if (textField.text.length >= 28) {
                textField.text = [textField.text substringToIndex:28];
            }
        }
    }
    return YES;
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

@end

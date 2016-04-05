//
//  SetTHViewController.m
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "SetTHViewController.h"
#import "AppDelegate.h"

@interface SetTHViewController ()

@end

@implementation SetTHViewController
AppDelegate *set_th_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.tag = 1;
    set_th_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = set_th_app.bgColor;
    
    [[_set_th_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_set_th_bgV layer] setBorderColor: set_th_app.borderColor.CGColor];//颜色
    [[_set_th_bgV layer]setCornerRadius:15.0];//圆角
    [[_set_th_bgV2 layer] setBorderWidth:1.5];//画线的宽度
    [[_set_th_bgV2 layer] setBorderColor: set_th_app.borderColor.CGColor];//颜色
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) {
        return YES;
    }
    if (textField.text.length >= 3) {
        return NO;
    }
    return [self validateNumber:string];
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField.text.length >= 3) {
        textField.text = [textField.text substringToIndex:3];
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


- (IBAction)set_th_okC:(id)sender {
    NSString *l = _set_th_L.text;
    if (l.length <= 0 || l.length > 3 || ![self validateNumber:l]) {
        NSString *msg = NSLocalizedString(@"setTHTip", nil);
        [self alert:msg];
        return;
    }
    NSString *h = _set_th_H.text;
    if (h.length <= 0 || h.length > 3 || ![self validateNumber:h]) {
        NSString *msg = NSLocalizedString(@"setTHTip1", nil);
        [self alert:msg];
        return;
    }
    
    if (l.length == 1) {
        l = [NSString stringWithFormat:@"00%@",l];
    }else if(l.length == 2){
        l = [NSString stringWithFormat:@"0%@",l];
    }
    
    if (h.length == 1) {
        h = [NSString stringWithFormat:@"00%@",h];
    }else if(l.length == 2){
        h = [NSString stringWithFormat:@"0%@",h];
    }
    //1234AINR1L底限值H高限值#
    NSString *mg = [NSString stringWithFormat:@"%@AINR%@L%@H%@#", set_th_app.sel_host_pwd, set_th_app.sel_seiral, l, h];
    [set_th_app.mainV sendMsg:mg phNum:set_th_app.sel_host_phNum];
}

-(void)alert:(NSString*)msg{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:ac animated:YES completion:nil];
}


@end

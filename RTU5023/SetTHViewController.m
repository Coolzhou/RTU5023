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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.tag = 1;
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    [[_set_th_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_set_th_bgV layer] setBorderColor: THEAPPDELEGATE.borderColor.CGColor];//颜色
    [[_set_th_bgV layer]setCornerRadius:15.0];//圆角
    [[_set_th_bgV2 layer] setBorderWidth:1.5];//画线的宽度
    [[_set_th_bgV2 layer] setBorderColor: THEAPPDELEGATE.borderColor.CGColor];//颜色
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) {
        return YES;
    }
    
    NSLog(@"ssss = %ld",[textField.text integerValue]);
    
    if ([THEAPPDELEGATE.sel_host_type isEqualToString:@"RTU5027"] && [THEAPPDELEGATE.sel_seiral isEqualToString:@"1"]) {
        if (([textField.text integerValue] > 0 &&textField.text.length >= 3)||([textField.text integerValue] < 0 && textField.text.length >=4)) {
            return NO;
        }
    }else{
        if (textField.text.length >= 3) {
            return NO;
        }
    }
    
    return [self validateNumber:string];
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    
    if ([THEAPPDELEGATE.sel_host_type isEqualToString:@"RTU5027"] && [THEAPPDELEGATE.sel_seiral isEqualToString:@"1"]) {
        if (([textField.text integerValue] < 0 && textField.text.length >=4)) {
            textField.text = [textField.text substringToIndex:4];
        }else if([textField.text integerValue]>0 && textField.text.length >=3){
            textField.text = [textField.text substringToIndex:3];
        }
    }else{
        if (textField.text.length >= 3) {
            textField.text = [textField.text substringToIndex:3];
        }
    }
    return YES;
}

- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    
    NSCharacterSet* tmpSet = nil;
    if ([THEAPPDELEGATE.sel_host_type isEqualToString:@"RTU5027"] && [THEAPPDELEGATE.sel_seiral isEqualToString:@"1"]) {
        tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"-0123456789"];
    }else{
        tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    }
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
    //高限
    NSString *h = _set_th_H.text;
    
    if ([THEAPPDELEGATE.sel_host_type isEqualToString:@"RTU5027"] && [THEAPPDELEGATE.sel_seiral isEqualToString:@"1"]) {
        //低限
        if (l.length <= 0 || l.length > 4 || ![self validateNumber:l]) {
            NSString *msg = NSLocalizedString(@"setTHTip", nil);
            [self alert:msg];
            return;
        }
        
        
        if (h.length <= 0 || h.length > 4 || ![self validateNumber:h]) {
            NSString *msg = NSLocalizedString(@"setTHTip1", nil);
            [self alert:msg];
            return;
        }
    }else{
        //低限
        if (l.length <= 0 || l.length > 3 || ![self validateNumber:l]) {
            NSString *msg = NSLocalizedString(@"setTHTip", nil);
            [self alert:msg];
            return;
        }
        //高限
        if (h.length <= 0 || h.length > 3 || ![self validateNumber:h]) {
            NSString *msg = NSLocalizedString(@"setTHTip1", nil);
            [self alert:msg];
            return;
        }
    }
    
    if (l.length == 1) {
        l = [NSString stringWithFormat:@"00%@",l];
    }else if(l.length == 2){
        l = [NSString stringWithFormat:@"0%@",l];
    }
    
    if (h.length == 1) {
        h = [NSString stringWithFormat:@"00%@",h];
    }else if(h.length == 2){
        h = [NSString stringWithFormat:@"0%@",h];
    }
    
    
    if ([THEAPPDELEGATE.sel_host_type isEqualToString:@"RTU5027"] && [THEAPPDELEGATE.sel_seiral isEqualToString:@"1"]) {
        //1234AINR1L底限值H高限值#
        NSString *mg = [NSString stringWithFormat:@"%@AINML%@H%@#", THEAPPDELEGATE.sel_host_pwd,l, h];
        
        NSLog(@"mg = %@",mg);
        
        [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
    }else{
        //1234AINR1L底限值H高限值#
        NSString *mg = [NSString stringWithFormat:@"%@AINR%@L%@H%@#", THEAPPDELEGATE.sel_host_pwd, THEAPPDELEGATE.sel_seiral, l, h];
        
        NSLog(@"mg = %@",mg);
        
        [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
    }
}

-(void)alert:(NSString*)msg{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:ac animated:YES completion:nil];
}


@end

//
//  SetAlarmViewController.m
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "SetAlarmViewController.h"
#import "AppDelegate.h"
#import "Unitl.h"
#import "SetTHNAVController.h"

@interface SetAlarmViewController (){
    Unitl *u;
    NSArray *ls;
}

@end

@implementation SetAlarmViewController
AppDelegate *set_alarm_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    set_alarm_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = set_alarm_app.bgColor;
    u = [[Unitl alloc] init];
    [[_set_alarm_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_set_alarm_bgV layer] setBorderColor: set_alarm_app.borderColor.CGColor];//颜色
    [[_set_alarm_bgV layer] setCornerRadius:15.0];//圆角
    [[_set_alarm_bgV2 layer] setBorderWidth:1.5];//画线的宽度
    [[_set_alarm_bgV2 layer] setBorderColor: set_alarm_app.borderColor.CGColor];//颜色
    
    if (set_alarm_app.langId == 0) {
        _set_alarm_t1.text = set_alarm_app.sel_host_T;
        if ([set_alarm_app.sel_host_T isEqualToString:@"Temperature"]) {
            _set_alarm_t1.text = @"温度";
        }
        _set_alarm_t2.text = set_alarm_app.sel_host_H;
        if ([set_alarm_app.sel_host_H isEqualToString:@"Humidty"]) {
            _set_alarm_t2.text = @"湿度";
        }
        _set_alarm_t3.text = set_alarm_app.sel_host_V;
        if ([set_alarm_app.sel_host_V isEqualToString:@"Voltage"]) {
            _set_alarm_t3.text = @"电压";
        }
    }else{
        _set_alarm_t1.text = set_alarm_app.sel_host_T;
        _set_alarm_t2.text = set_alarm_app.sel_host_H;
        _set_alarm_t3.text = set_alarm_app.sel_host_V;
    }
    
    
    ls = @[_set_alarm_h1, _set_alarm_l1, _set_alarm_h2, _set_alarm_l2,_set_alarm_h3, _set_alarm_l3];
    
    UITapGestureRecognizer *tap;
    for (UILabel *l in ls) {
        [[l layer] setBorderWidth:1];//画线的宽度
        [[l layer] setBorderColor: set_alarm_app.borderColor.CGColor];//颜色
        
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hLClick:)];
        [l addGestureRecognizer:tap];
    }
}

-(void)hLClick:(UIGestureRecognizer *)rec {
    if (rec.state == UIGestureRecognizerStateEnded) {
        set_alarm_app.sel_seiral = [NSString stringWithFormat:@"%ld", rec.view.tag];
        
        SetTHNAVController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"setth"];
        [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)set_alarm_ok1C:(id)sender {
    NSString *s = _set_alarm_t1.text;
    if (s == nil || s.length < 1) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"setAlarmTip", nil) preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
        return;
    }
    BOOL b = [u updateSETTING_Name:s index:1 phNum:set_alarm_app.sel_host_phNum];
    if (b) {
        NSString *mg = [NSString stringWithFormat:@"%@AIN1T%@", set_alarm_app.sel_host_pwd, s];
        [set_alarm_app.mainV sendMsg:mg phNum:set_alarm_app.sel_host_phNum];
    }
}

- (IBAction)set_alarm_ok2c:(id)sender {
    NSString *s = _set_alarm_t2.text;
    if (s == nil || s.length < 1) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"setAlarmTip", nil) preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
        return;
    }
    BOOL b = [u updateSETTING_Name:s index:2 phNum:set_alarm_app.sel_host_phNum];
    if (b) {
        NSString *mg = [NSString stringWithFormat:@"%@AIN2T%@", set_alarm_app.sel_host_pwd, s];
        [set_alarm_app.mainV sendMsg:mg phNum:set_alarm_app.sel_host_phNum];
    }
}

- (IBAction)set_alarm_ok3C:(id)sender {
    NSString *s = _set_alarm_t3.text;
    if (s == nil || s.length < 1) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"setAlarmTip", nil) preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
        return;
    }
    BOOL b = [u updateSETTING_Name:s index:3 phNum:set_alarm_app.sel_host_phNum];
    if (b) {
        NSString *mg = [NSString stringWithFormat:@"%@AIN3T%@", set_alarm_app.sel_host_pwd, s];
        [set_alarm_app.mainV sendMsg:mg phNum:set_alarm_app.sel_host_phNum];
    }
}
@end

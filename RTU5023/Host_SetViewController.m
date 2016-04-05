//
//  Host_SetViewController.m
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "Host_SetViewController.h"
#import "AppDelegate.h"

@interface Host_SetViewController ()

@end

@implementation Host_SetViewController
AppDelegate *host_set_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    host_set_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = host_set_app.bgColor;
    [[_host_set_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_host_set_bgV layer] setBorderColor: host_set_app.borderColor.CGColor];//颜色
    [[_host_set_bgV layer]setCornerRadius:15.0];//圆角
    [[_host_set_bgV2 layer] setBorderWidth:1.0];//画线的宽度
    [[_host_set_bgV2 layer] setBorderColor: host_set_app.borderColor.CGColor];//颜色
    if (host_set_app.langId == 0) {
        _host_set_t1.text = host_set_app.sel_host_T;
        if ([host_set_app.sel_host_T isEqualToString:@"Temperature"]) {
            _host_set_t1.text = @"温度";
        }
         _host_set_t2.text = host_set_app.sel_host_H;
        if ([host_set_app.sel_host_H isEqualToString:@"Humidty"]) {
            _host_set_t2.text = @"湿度";
        }
        _host_set_t3.text = host_set_app.sel_host_V;
        if ([host_set_app.sel_host_V isEqualToString:@"Voltage"]) {
            _host_set_t3.text = @"电压";
        }
    }else{
        _host_set_t1.text = host_set_app.sel_host_T;
        _host_set_t2.text = host_set_app.sel_host_H;
        _host_set_t3.text = host_set_app.sel_host_V;
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


- (IBAction)host_set_nameC:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AIN123", host_set_app.sel_host_pwd];
    [host_set_app.mainV sendMsg:msg phNum:host_set_app.sel_host_phNum];
}

- (IBAction)host_set_alarmC:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AINR", host_set_app.sel_host_pwd];
    [host_set_app.mainV sendMsg:msg phNum:host_set_app.sel_host_phNum];
}
@end

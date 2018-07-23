//
//  SetP1ViewController.m
//  S275
//
//  Created by paul on 16/3/10.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "SetP1ViewController.h"
#import "AppDelegate.h"
#import "RTUNavigationController.h"
#import "UserNavigationController.h"
#import "SetAlarmNAVController.h"
#import "AutoNAVController.h"
#import "LanguageNAVController.h"
#import "DailyNavigationController.h"
#import "PWDNavigationController.h"
#import "CycleNAVController.h"

@interface SetP1ViewController ()

@end

@implementation SetP1ViewController
AppDelegate *setP1_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.tag = 1;
    setP1_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = setP1_app.bgColor;
    //131 136 155
    UIColor *c = [UIColor colorWithRed:131.0/255.0 green:136.0/255.0  blue:155.0/255.0  alpha:1.0];
    
    [[_setP1_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_setP1_bgV layer] setBorderColor: setP1_app.borderColor.CGColor];//颜色
    [[_setP1_bgV layer]setCornerRadius:15.0];//圆角
    [[_setP1_bg2V layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_bg2V layer] setBorderColor: setP1_app.borderColor.CGColor];//颜色
    
    [[_setP1_L1 layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_L1 layer] setBorderColor: c.CGColor];//颜色
    [[_setP1_L2 layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_L2 layer] setBorderColor: c.CGColor];//颜色
    [[_setP1_L3 layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_L3 layer] setBorderColor: c.CGColor];//颜色
    [[_setP1_L4 layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_L4 layer] setBorderColor: c.CGColor];//颜色
    [[_setP1_L5 layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_L5 layer] setBorderColor: c.CGColor];//颜色
    [[_setP1_L6 layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_L6 layer] setBorderColor: c.CGColor];//颜色
    [[_setP1_L7 layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_L7 layer] setBorderColor: c.CGColor];//颜色
    [[_setP1_L8 layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_L8 layer] setBorderColor: c.CGColor];//颜色
    [[_setP1_L9 layer] setBorderWidth:1.5];//画线的宽度
    [[_setP1_L9 layer] setBorderColor: c.CGColor];//颜色
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setP1_SyncTimeClick:(id)sender{
    RTUNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"rtu"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    
}
- (IBAction)setP1_numClick:(id)sender{
    UserNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"user"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    
}

//设置温度电压参数
- (IBAction)setP1_setClick:(id)sender{
    SetAlarmNAVController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"seta"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];

    
}
- (IBAction)setP1_dailyClick:(id)sender{
    DailyNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"daily"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    
}
- (IBAction)setP1_autoClick:(id)sender{
    AutoNAVController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"auto"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    
}
- (IBAction)setP1_languageClick:(id)sender{
    LanguageNAVController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"language"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
}

- (IBAction)setP1_pwdClick:(id)sender {
    PWDNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"set_pwd"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
}

- (IBAction)setP1_cycleClick:(id)sender {
    CycleNAVController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"cycle"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
}

- (IBAction)setP1_keyClick:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@RESET", setP1_app.sel_host_pwd];
    [setP1_app.mainV sendMsg:msg phNum:setP1_app.sel_host_phNum];
}



@end

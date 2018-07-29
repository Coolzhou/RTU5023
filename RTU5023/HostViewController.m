//
//  HostViewController.m
//  S275
//
//  Created by paul on 16/3/9.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "HostViewController.h"
#import "AppDelegate.h"
#import "Host_SetNavigationController.h"
#import "Host_RECO_NAVController.h"
#import "Hot_Set_ViewController_sixs.h"
#import "Hot_Set_ViewController_sevens.h"
#import "Hot_Set_ViewController_eight.h"

@interface HostViewController (){
    
}

@end

@implementation HostViewController
AppDelegate *hostV_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.tag = 0;
    hostV_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = hostV_app.bgColor;
    
    [[_host_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_host_bgV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    [[_host_bgV layer]setCornerRadius:15.0];//圆角
    [[_host_phoneV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_phoneV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    
    [[_host_relayV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_relayV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    [[_host_lockV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_lockV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    [[_host_unLockV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_unLockV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    [[_host_statusV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_statusV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    [[_host_ainV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_ainV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    [[_host_onlineV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_onlineV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    [[_host_pulseV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_pulseV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    [[_host_rebootV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_rebootV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    
    [[_host_cycleV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_cycleV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
    [[_host_keyV layer] setBorderWidth:1.0];//画线的宽度
    [[_host_keyV layer] setBorderColor: hostV_app.borderColor.CGColor];//颜色
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hostPhoneClick:(id)sender {
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@", hostV_app.sel_host_phNum];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}


//查询设备状态参数
- (IBAction)hostRelayClick:(id)sender {
    
    if ([hostV_app.sel_host_type isEqualToString:@"RTU5023"]) {
        Host_SetNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"host_set"];
        [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    }else if ([hostV_app.sel_host_type isEqualToString:@"RTU5026"]){
        Hot_Set_ViewController_sixs *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"Hot_Set_ViewController_sixs"];
        [self.navigationController pushViewController:hnc animated:YES];
    }else if ([hostV_app.sel_host_type isEqualToString:@"RTU5027"]){
        Hot_Set_ViewController_sevens *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"Hot_Set_ViewController_seven"];
        [self.navigationController pushViewController:hnc animated:YES];
    }else{
        Hot_Set_ViewController_eight *eight = [self.storyboard instantiateViewControllerWithIdentifier:@"Hot_Set_ViewController_eight"];
        [self.navigationController pushViewController:eight animated:YES];
    }
}

- (IBAction)hostAINClick:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@D#T#", hostV_app.sel_host_pwd];
    [hostV_app.mainV sendMsg:msg phNum:hostV_app.sel_host_phNum];
}

- (IBAction)hostLockClick:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AA", hostV_app.sel_host_pwd];
    [hostV_app.mainV sendMsg:msg phNum:hostV_app.sel_host_phNum];
}

- (IBAction)hostUnlockClick:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@BB", hostV_app.sel_host_pwd];
    [hostV_app.mainV sendMsg:msg phNum:hostV_app.sel_host_phNum];
}

- (IBAction)hostOnlineClick:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@DRT", hostV_app.sel_host_pwd];
    [hostV_app.mainV sendMsg:msg phNum:hostV_app.sel_host_phNum];
}

- (IBAction)hostStatusClick:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@DT", hostV_app.sel_host_pwd];
    [hostV_app.mainV sendMsg:msg phNum:hostV_app.sel_host_phNum];
}

- (IBAction)hostPulseClick:(id)sender {
    Host_RECO_NAVController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"host_reco"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
}

- (IBAction)hostRebootClick:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@EE", hostV_app.sel_host_pwd];
    [hostV_app.mainV sendMsg:msg phNum:hostV_app.sel_host_phNum];
}

- (IBAction)hostCycleClick:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@RE", hostV_app.sel_host_pwd];
    [hostV_app.mainV sendMsg:msg phNum:hostV_app.sel_host_phNum];
}

- (IBAction)hostKeyClick:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@RT", hostV_app.sel_host_pwd];
    [hostV_app.mainV sendMsg:msg phNum:hostV_app.sel_host_phNum];
}
@end

//
//  AppPWDViewController.m
//  k3
//
//  Created by amttgroup on 16/2/17.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "AppPWDViewController.h"
#import "AppDelegate.h"
#import "Unitl.h"
#import "SetPWDNavigationController.h"

@interface AppPWDViewController (){
    Unitl *u;
}

@end

@implementation AppPWDViewController
AppDelegate *appPWD_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appPWD_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = appPWD_app.bgColor;
    u = [Unitl new];
    
    _app_pwdTitleL.text = NSLocalizedString(@"appPWDTitleL", nil);
    _app_pwdOpenL.text = NSLocalizedString(@"appPWDOpenL", nil);
    _app_pwdCloseL.text = NSLocalizedString(@"appPWDCloseL", nil);
}

-(void)viewWillAppear:(BOOL)animated {
    if (appPWD_app.isSetAppPwd) {
        _app_pwdOpenSelIMG.alpha = 1;
        _app_pwdCloseSelIMG.alpha = 0;
    }else{
        _app_pwdOpenSelIMG.alpha = 0;
        _app_pwdCloseSelIMG.alpha = 1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pwdOpenClick:(id)sender {
    if (!appPWD_app.isSetAppPwd) {
        appPWD_app.isCloseAppPWD = NO;
        appPWD_app.isEntry = NO;
        SetPWDNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"setPWD"];
        [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
        
//        appPWD_app.isSetAppPwd = YES;
        _app_pwdOpenSelIMG.alpha = 1;
        _app_pwdCloseSelIMG.alpha = 0;
    }
    
}

- (IBAction)pwdCloseClick:(id)sender {
    if (appPWD_app.isSetAppPwd) {
        appPWD_app.isCloseAppPWD = YES;
        appPWD_app.isEntry = NO;
        SetPWDNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"setPWD"];
        [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    }
}
@end

//
//  AppDelegate.h
//  k3
//
//  Created by amttgroup on 16/2/16.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property int langId;
@property ViewController *mainV;
@property NSString *sel_host_phNum;
@property NSString *sel_host_name;
@property NSString *sel_host_pwd;
@property NSString *sel_host_remarks;
@property NSString *sel_host_type;


@property NSString *sel_host_T;
@property NSString *sel_host_H;
@property NSString *sel_host_V;

@property NSString *documentDirectory;
@property BOOL isAddHost;
@property UIColor *borderColor;
@property UIColor *bgColor;

@property BOOL isSetAppPwd;//是否设置APP密码
@property BOOL isCloseAppPWD;// 是否关闭APP密码
@property NSString *appPWD;//APP密码
@property BOOL isEntry;//是否进入状态 进入的APP密码设置页面

@property NSString *sel_seiral;//

@end


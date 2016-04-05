//
//  LanguageViewController.m
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "LanguageViewController.h"
#import "AppDelegate.h"

@interface LanguageViewController (){
    BOOL isCN;
}

@end

@implementation LanguageViewController
AppDelegate *lang_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    lang_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = lang_app.bgColor;
    [[_language_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_language_bgV layer] setBorderColor: lang_app.borderColor.CGColor];//颜色
    [[_language_bgV layer]setCornerRadius:15.0];//圆角
    [[_language_bgV2 layer] setBorderWidth:1.0];//画线的宽度
    [[_language_bgV2 layer] setBorderColor: lang_app.borderColor.CGColor];//颜色
    isCN = NO;
    
    [[_language_cl layer] setBorderWidth:1.0];//画线的宽度
    [[_language_cl layer] setBorderColor: lang_app.borderColor.CGColor];//颜色
    [[_language_el layer] setBorderWidth:1.0];//画线的宽度
    [[_language_el layer] setBorderColor: lang_app.borderColor.CGColor];//颜色
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)language_cnC:(id)sender {
    if (!isCN) {
        isCN = YES;
        [_language_cl setBackgroundColor:[UIColor colorWithRed:1.0/255.0 green:160.0/255.0 blue:199.0/255.0 alpha:1]];
        [_language_cl setTextColor:[UIColor whiteColor]];
        [_language_el setBackgroundColor:lang_app.bgColor];
        [_language_el setTextColor:[UIColor blackColor]];
        
    }
}

- (IBAction)language_enC:(id)sender {
    if (isCN) {
        isCN = NO;
        [_language_el setBackgroundColor:[UIColor colorWithRed:1.0/255.0 green:160.0/255.0 blue:199.0/255.0 alpha:1]];
        [_language_el setTextColor:[UIColor whiteColor]];
        [_language_cl setBackgroundColor:lang_app.bgColor];
        [_language_cl setTextColor:[UIColor blackColor]];
        
    }
}

- (IBAction)language_okC:(id)sender {
    NSString *s = isCN ? @"CN" : @"EN";
    NSString *msg = [NSString stringWithFormat:@"%@%@", lang_app.sel_host_pwd,s];
    [lang_app.mainV sendMsg:msg phNum:lang_app.sel_host_phNum];
}
@end

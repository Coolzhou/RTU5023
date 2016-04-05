//
//  TypeViewController.m
//  S275
//
//  Created by paul on 16/3/7.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "TypeViewController.h"
#import "AppDelegate.h"

@interface TypeViewController (){
    NSString *selType;
}

@end

@implementation TypeViewController
AppDelegate *type_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    type_app = [[UIApplication sharedApplication] delegate];
    
    if (type_app.isAddHost) {
        _sel270Img.alpha = 1;
        type_app.sel_host_type = @"RTU5023";
        selType = @"RTU5023";
    }else{
        selType = type_app.sel_host_type;
        _sel270Img.alpha = 1;
        
    }
    
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rtu270SelClick:(id)sender {
    selType = @"RTU5023";
    _sel270Img.alpha = 1;
}

- (IBAction)typeSaveClick:(id)sender {
    type_app.sel_host_type = selType;
    [self.navigationController  popViewControllerAnimated:YES];
}
@end

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
@property (weak, nonatomic) IBOutlet UIButton *rtu5023;
@property (weak, nonatomic) IBOutlet UIButton *rtu5026;
@property (weak, nonatomic) IBOutlet UIButton *rtu5027;
@property (weak, nonatomic) IBOutlet UIButton *rtu5028;
@property (weak, nonatomic) IBOutlet UIButton *rtu5029;


@property (nonatomic,strong) UIButton *currentBtn;

@property (nonatomic, strong) NSMutableArray *btnArr;

@end

@implementation TypeViewController
AppDelegate *type_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    type_app = [[UIApplication sharedApplication] delegate];
    
    NSLog(@"type = %@",type_app.sel_host_type);
    
    if (type_app.isAddHost) {
        _sel270Img.alpha = 1;
        type_app.sel_host_type = @"RTU5023";
        selType = @"RTU5023";
    }else{
        selType = type_app.sel_host_type;
        _sel270Img.alpha = 1;
    }
    
    self.btnArr = [NSMutableArray arrayWithObjects:self.rtu5023,self.rtu5026,self.rtu5027,self.rtu5028,self.rtu5029, nil];
    
    for (UIButton *btn in self.btnArr) {
        if ([type_app.sel_host_type isEqualToString:btn.titleLabel.text]) {
            btn.selected = YES;
            type_app.sel_host_type = btn.titleLabel.text;
            self.currentBtn = self.rtu5023;
        }
    }
    
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rtu270SelClick:(UIButton *)sender {
    
    if (sender != self.currentBtn) {
        sender.selected = YES;
        self.currentBtn.selected = NO;
        self.currentBtn = sender;
    }
    
    switch (sender.tag) {
        case 1:
            selType = @"RTU5023";
            break;
        case 2:
            selType = @"RTU5026";
            break;
        case 3:
            selType = @"RTU5027";
            break;
        case 4:
            selType = @"RTU5028";
            break;
        case 5:
            selType = @"RTU5029";
            break;
        default:
            break;
    }
}

- (IBAction)typeSaveClick:(id)sender {
    type_app.sel_host_type = selType;
    [self.navigationController  popViewControllerAnimated:YES];
}
@end

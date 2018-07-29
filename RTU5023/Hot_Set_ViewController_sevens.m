//
//  Hot_Set_ViewController_seven.m
//  RTU5023
//
//  Created by zhou on 2018/7/23.
//  Copyright © 2018年 paul. All rights reserved.
//

#import "Hot_Set_ViewController_sevens.h"
@interface Hot_Set_ViewController_sevens ()
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIView *bgView2;
@end

@implementation Hot_Set_ViewController_sevens
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    
    if (THEAPPDELEGATE.langId == 0) {
        _host_set_t1.text = THEAPPDELEGATE.sel_host_AIN;
        if ([THEAPPDELEGATE.sel_host_AIN isEqualToString:@"AIN"]) {
            _host_set_t1.text = @"AIN";
        }
        _host_set_t2.text = THEAPPDELEGATE.sel_host_V;
        if ([THEAPPDELEGATE.sel_host_V isEqualToString:@"Voltage"]) {
            _host_set_t2.text = @"电压";
        }
    }else{
        _host_set_t1.text = THEAPPDELEGATE.sel_host_AIN;
        _host_set_t2.text = THEAPPDELEGATE.sel_host_V;
    }
}

- (IBAction)clickAIMBtnSender:(UIButton *)sender {
    
    NSString *msg = [NSString stringWithFormat:@"%@AINM", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}


- (IBAction)host_set_nameC:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AIN123", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)host_set_alarmC:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AINR", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

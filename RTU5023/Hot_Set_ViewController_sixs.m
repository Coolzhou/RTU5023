//
//  Hot_Set_ViewController_sixs.m
//  RTU5023
//
//  Created by zhou on 2018/7/24.
//  Copyright © 2018年 paul. All rights reserved.
//

#import "Hot_Set_ViewController_sixs.h"

@interface Hot_Set_ViewController_sixs ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *bgView2;

@end

@implementation Hot_Set_ViewController_sixs

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    
    if (THEAPPDELEGATE.langId == 0) {
        self.host_set_t1.text = THEAPPDELEGATE.sel_host_T;
        if ([THEAPPDELEGATE.sel_host_T isEqualToString:@"Temperature"]) {
            self.host_set_t1.text = @"温度";
        }

        self.host_set_t2.text = THEAPPDELEGATE.sel_host_V;
        if ([THEAPPDELEGATE.sel_host_V isEqualToString:@"Voltage"]) {
            self.host_set_t2.text = @"电压";
        }
    }else{
        _host_set_t1.text = THEAPPDELEGATE.sel_host_T;
        _host_set_t2.text = THEAPPDELEGATE.sel_host_V;
    }
    

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

//
//  SetAlarmViewController_nine.m
//  RTU5023
//
//  Created by zhou on 2018/7/29.
//  Copyright © 2018年 paul. All rights reserved.
//

#import "SetAlarmViewController_nine.h"
#import "AppDelegate.h"
#import "Unitl.h"
@interface SetAlarmViewController_nine ()
{
    Unitl *u;
    NSArray *ls;
}
@property (weak, nonatomic) IBOutlet UIView *bgView;
    @property (weak, nonatomic) IBOutlet UILabel *titleLable;
    
@property (weak, nonatomic) IBOutlet UIScrollView *bgView2;
@end

@implementation SetAlarmViewController_nine

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    u = [[Unitl alloc] init];
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    
    self.titleLable.text = NSLocalizedString(@"ao_5029_title", nil);
}

//时间
- (IBAction)clickChaBtn1:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AINQ", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
    
}

- (IBAction)clickSetupBtn1:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AIN1Q%@", THEAPPDELEGATE.sel_host_pwd,self.textField1.text];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickSetupBtn2:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AIN2Q%@", THEAPPDELEGATE.sel_host_pwd,self.textField2.text];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}

//内容

- (IBAction)clickChaBtn2:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AINA", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
    
}

- (IBAction)clickSetupBtn3:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AINA1T%@", THEAPPDELEGATE.sel_host_pwd,self.textField3.text];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickSetupBtn4:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AINA2T%@", THEAPPDELEGATE.sel_host_pwd,self.textField4.text];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}


//恢复内容
- (IBAction)clickChaBtn3:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AINN", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
    
}

- (IBAction)clickSetupBtn5:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AINN1T%@", THEAPPDELEGATE.sel_host_pwd,self.textField5.text];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickSetupBtn6:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AINN2T%@", THEAPPDELEGATE.sel_host_pwd,self.textField6.text];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}

//设备名称
- (IBAction)clickChaBtn4:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@DN", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
    
}

- (IBAction)clickSetupBtn7:(UIButton *)sender {
    NSString *msg = [NSString stringWithFormat:@"%@DN%@", THEAPPDELEGATE.sel_host_pwd,self.textField7.text];
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

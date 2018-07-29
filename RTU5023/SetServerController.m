//
//  SetServerController.m
//  RTU5023
//
//  Created by zhou on 2018/7/29.
//  Copyright © 2018年 paul. All rights reserved.
//

#import "SetServerController.h"

@interface SetServerController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIScrollView *bgView2;

@end

@implementation SetServerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
}

- (IBAction)clickSetupBtn1:(id)sender {
    
    NSString *mg = [NSString stringWithFormat:@"%@IP%@*%@", THEAPPDELEGATE.sel_host_pwd,self.textField1.text,self.textField2.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickChaBtn1:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@IP", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickDelBtn:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@IPDEL", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

//picker ID
- (IBAction)clickSetupBtn2:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@GPRSON%@", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickChaBtn2:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@INTE", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickDelBtn2:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@GPRSOFF", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
    
}

// --------------
- (IBAction)clickSetupBtn3:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@RTP%@", THEAPPDELEGATE.sel_host_pwd,self.textField3.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickChaBtn3:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@RTE", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickSetupBtn4:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@HET%@", THEAPPDELEGATE.sel_host_pwd,self.textField4.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickChaBtn4:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@HEE", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickSetupBtn5:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@HT%@", THEAPPDELEGATE.sel_host_pwd,self.textField5.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickChaBtn5:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@HTE", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickSetupBtn6:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@RECONT%@", THEAPPDELEGATE.sel_host_pwd,self.textField6.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickChaBtn6:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@RECONT", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickAgainBtn:(id)sender {
    
    NSString *mg = [NSString stringWithFormat:@"%@GPRSonline", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
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

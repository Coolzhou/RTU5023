//
//  SetSIMParmsController.m
//  RTU5023
//
//  Created by zhou on 2018/7/29.
//  Copyright © 2018年 paul. All rights reserved.
//

#import "SetSIMParmsController.h"

@interface SetSIMParmsController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *bgView2;

@end

@implementation SetSIMParmsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickSetupBtnSender:(UIButton *)sender {
    
//    if (self.textField1.text.length <=0 ||self.textField2.text.length <=0 || self.textField3.text.length <=0) {
//        return;
//    }
    
    NSString *mg = [NSString stringWithFormat:@"%@AP%@#%@#%@", THEAPPDELEGATE.sel_host_pwd,self.textField1.text,self.textField2.text,self.textField3.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
    
}

- (IBAction)clickChaBtnSender:(UIButton *)sender {
    NSString *mg = [NSString stringWithFormat:@"%@AP", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickDelBtnSender:(UIButton *)sender {
    NSString *mg = [NSString stringWithFormat:@"%@APDEL", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
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

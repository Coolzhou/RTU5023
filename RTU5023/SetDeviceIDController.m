//
//  SetDeviceIDController.m
//  RTU5023
//
//  Created by zhou on 2018/7/29.
//  Copyright © 2018年 paul. All rights reserved.
//

#import "SetDeviceIDController.h"

@interface SetDeviceIDController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *bgView2;

@end

@implementation SetDeviceIDController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    [self.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldChange:(UITextField *)textField{
    
        NSString *textStr = textField.text;
        if ([textField.text integerValue] > 65535 && textField.text.length <= 5) {
            textField.text = [textStr substringToIndex:4];
        }else if (textField.text.length>5){
            textField.text = [textStr substringToIndex:5];
        }else{
            
        }
}
- (IBAction)clickSetupBtnSender:(id)sender {
    
    NSString *mg = [NSString stringWithFormat:@"%@ID%@", THEAPPDELEGATE.sel_host_pwd,self.textField.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];

}

- (IBAction)clickChaBtnSender:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@IDE", THEAPPDELEGATE.sel_host_pwd];
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

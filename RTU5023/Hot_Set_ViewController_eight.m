//
//  Hot_Set_ViewController_eight.m
//  RTU5023
//
//  Created by zhou on 2018/7/29.
//  Copyright © 2018年 paul. All rights reserved.
//

#import "Hot_Set_ViewController_eight.h"

@interface Hot_Set_ViewController_eight ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *bgView2;
    @property (weak, nonatomic) IBOutlet UILabel *titleLable;
    
@end

@implementation Hot_Set_ViewController_eight

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    
    self.titleLable.text = NSLocalizedString(@"ao_5028_title", nil);
}

- (IBAction)clickOkButtonSender:(UIButton *)sender {
    
    if ([self.textField.text integerValue] > 65535 || [self.textField.text integerValue] < 0 ) {
        NSLog(@"ssssssss");
        return;
    }
    NSString *msg = [NSString stringWithFormat:@"%@AOT%@", THEAPPDELEGATE.sel_host_pwd,self.textField.text];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickinquirTimeBtn:(UIButton *)sender {
    
    NSString *msg = [NSString stringWithFormat:@"%@AOT", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}


- (IBAction)clickOpenStateBtn:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AON", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickOffStateBtn:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AOF", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:msg phNum:THEAPPDELEGATE.sel_host_phNum];
}
- (IBAction)clickInquirStateBtn:(id)sender {
    NSString *msg = [NSString stringWithFormat:@"%@AOE", THEAPPDELEGATE.sel_host_pwd];
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

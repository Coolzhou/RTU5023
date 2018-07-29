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

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation SetServerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    
    self.dataArr = [NSArray arrayWithObjects:@"1、Modbus RTU协议",@"2、Modbus TCP协议",@"3、自定义协议", nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArr.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *myView = nil;
    NSString *t = nil;
    t = [self.dataArr objectAtIndex:row];
    myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, self.pickView.frame.size.width, 20)];
    myView.textAlignment = NSTextAlignmentCenter;
    myView.text = t;
    myView.font = [UIFont systemFontOfSize:13];         //用label来设置字体大小
    myView.backgroundColor = [UIColor clearColor];
    return myView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return 50.0f;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 20.0f;
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
    
    NSInteger row = [self.pickView selectedRowInComponent:0];
    NSLog(@"row = %ld",row);
    
    NSString *mg = [NSString stringWithFormat:@"%@GPRSON%ld", THEAPPDELEGATE.sel_host_pwd,row+1];
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

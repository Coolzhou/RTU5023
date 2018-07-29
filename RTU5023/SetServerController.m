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
    @property (weak, nonatomic) IBOutlet UILabel *titleLable;
    
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation SetServerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLable.text = NSLocalizedString(@"connect_parameter", nil);
    
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    
    NSString *protocol1 = NSLocalizedString(@"protocol_1", nil);
    NSString *protocol2 = NSLocalizedString(@"protocol_2", nil);
    NSString *protocol3 = NSLocalizedString(@"protocol_3", nil);
    
    self.dataArr = [NSArray arrayWithObjects:protocol1,protocol2,protocol3, nil];
    
    [self.textField3 addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.textField4 addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.textField5 addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.textField6 addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldChange:(UITextField *)textField{
    
    if (textField == self.textField6) {
        NSString *textStr = textField.text;
        if ([textField.text integerValue] > 65535 && textField.text.length <= 5) {
            textField.text = [textStr substringToIndex:4];
        }else if (textField.text.length>5){
            textField.text = [textStr substringToIndex:5];
        }else{
            
        }
    }else if (textField == self.textField5){
        NSString *textStr = textField.text;
        if ([textField.text integerValue] >= 10000) {
            textField.text = [textStr substringToIndex:4];
        }
    }else{
        
        NSInteger maxLength = 20;
        if (self.textField3 == textField) {
            maxLength = 50;
        }else if(self.textField4 == textField){
            maxLength = 20;
        }
        NSString *toBeString = textField.text;
        UITextRange *selectedRange = [textField markedTextRange];
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
        if (!position){
            if (toBeString.length > maxLength){
                //中文和emoj表情存在问题，需要对此进行处理
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
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
    
    if (self.textField1.text.length<=0 || self.textField2.text.length <= 0) {
        return;
    }
    
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
    if (self.textField3.text.length<=0) {
        return;
    }
    NSString *mg = [NSString stringWithFormat:@"%@RTP%@", THEAPPDELEGATE.sel_host_pwd,self.textField3.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickChaBtn3:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@RTE", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickSetupBtn4:(id)sender {
    if (self.textField4.text.length<=0) {
        return;
    }
    NSString *mg = [NSString stringWithFormat:@"%@HET%@", THEAPPDELEGATE.sel_host_pwd,self.textField4.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickChaBtn4:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@HEE", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickSetupBtn5:(id)sender {
    NSInteger time = [self.textField5.text integerValue];
    if (time<=0) {
        return;
    }
    NSString *mg = [NSString stringWithFormat:@"%@HT%@", THEAPPDELEGATE.sel_host_pwd,self.textField5.text];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickChaBtn5:(id)sender {
    NSString *mg = [NSString stringWithFormat:@"%@HTE", THEAPPDELEGATE.sel_host_pwd];
    [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
}

- (IBAction)clickSetupBtn6:(id)sender {
    
    NSInteger time = [self.textField6.text integerValue];
    if (time<60) {
        return;
    }
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

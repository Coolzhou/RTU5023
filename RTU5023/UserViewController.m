//
//  UserViewController.m
//  S275
//
//  Created by paul on 16/3/14.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "UserViewController.h"
#import "AppDelegate.h"

@interface UserViewController (){
    int editTextTag;
    BOOL isKeyShow;
    NSMutableArray *datas;
}

@end

@implementation UserViewController
AppDelegate *user_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.tag = 1;
    user_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = user_app.bgColor;
    
    editTextTag = -1;
    isKeyShow = NO;
    
    [[_user_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_user_bgV layer] setBorderColor: user_app.borderColor.CGColor];//颜色
    [[_user_bgV layer]setCornerRadius:15.0];//圆角
    [[_user_bgV2 layer] setBorderWidth:1.5];//画线的宽度
    [[_user_bgV2 layer] setBorderColor: user_app.borderColor.CGColor];//颜色
    datas = [NSMutableArray new];
    for (int i = 1; i < 11; i++) {
        [datas addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewWillDisappear:(BOOL)animated {
    isKeyShow = NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return datas.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *myView = nil;
    NSString *t = nil;
    t = [datas objectAtIndex:row];
    myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 60, 20)];
    myView.textAlignment = NSTextAlignmentCenter;
    myView.text = t;
    myView.font = [UIFont systemFontOfSize:15];         //用label来设置字体大小
    myView.backgroundColor = [UIColor clearColor];
    return myView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return 50.0f;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 20.0f;
}



- (IBAction)user_addClick:(id)sender {
    NSInteger row = [_user_picker selectedRowInComponent:0];
    NSString *s =  [datas objectAtIndex:row];
    if (s.length == 1) {
        s = [NSString stringWithFormat:@"0%@",s];
    }
    
    NSString *num = _user_numText.text;
    if (num.length <= 0 || num.length > 21 || ![self validateNumber:num]) {
        NSString *msg = NSLocalizedString(@"userTip2", nil);
        [self alert:msg];
        return;
    }
    
    NSString *mg = [NSString stringWithFormat:@"%@A%@T%@", user_app.sel_host_pwd, s, num];
    [user_app.mainV sendMsg:mg phNum:user_app.sel_host_phNum];
}

- (IBAction)user_searchClick:(id)sender {
    NSInteger row = [_user_picker selectedRowInComponent:0];
    NSString *s =  [datas objectAtIndex:row];
    if (s.length == 1) {
        s = [NSString stringWithFormat:@"0%@",s];
    }

    NSString *mg = [NSString stringWithFormat:@"%@A", user_app.sel_host_pwd];
    [user_app.mainV sendMsg:mg phNum:user_app.sel_host_phNum];
}

- (IBAction)user_delClick:(id)sender {
    NSInteger row = [_user_picker selectedRowInComponent:0];
    NSString *s =  [datas objectAtIndex:row];
    if (s.length == 1) {
        s = [NSString stringWithFormat:@"0%@",s];
    }
    NSString *msg = NSLocalizedString(@"userTip3", nil);
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"userAlerOkBtn", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *mg = [NSString stringWithFormat:@"%@A%@", user_app.sel_host_pwd, s];
        [user_app.mainV sendMsg:mg phNum:user_app.sel_host_phNum];
    }]];
    [ac addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"userAlerCanBtn", nil) style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:ac animated:YES completion:nil];
    
    
    
}


-(void)alert:(NSString*)msg{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:ac animated:YES completion:nil];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    editTextTag = (int)textField.tag;
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) {
        return YES;
    }
    if (textField.text.length >= 21) {
        return NO;
    }
    return [self validateNumber:string];
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField.text.length >= 21) {
        textField.text = [textField.text substringToIndex:28];
    }
    return YES;
}

- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


-(CGFloat)keyboardEndingFrameHeight:(NSDictionary *)userInfo//计算键盘的高度
{
    CGRect keyboardEndingUncorrectedFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGRect keyboardEndingFrame = [self.view convertRect:keyboardEndingUncorrectedFrame fromView:nil];
    return keyboardEndingFrame.size.height;
}

-(void)keyboardWillAppear:(NSNotification *)notification
{
    if ((editTextTag == 1 )&& !isKeyShow) {
        isKeyShow = YES;
        CGRect currentFrame = self.view.frame;
        CGFloat change = [self keyboardEndingFrameHeight:[notification userInfo]];
        currentFrame.origin.y = currentFrame.origin.y - change ;
        self.view.frame = currentFrame;
    }
    
}

-(void)keyboardWillDisappear:(NSNotification *)notification
{
    if (isKeyShow) {
        isKeyShow = NO;
        CGRect currentFrame = self.view.frame;
        CGFloat change = [self keyboardEndingFrameHeight:[notification userInfo]];
        currentFrame.origin.y = currentFrame.origin.y + change ;
        self.view.frame = currentFrame;
    }
    
}

@end

//
//  SetAlarmViewController_six.m
//  RTU5023
//
//  Created by zhou on 2018/7/24.
//  Copyright © 2018年 paul. All rights reserved.
//

#import "SetAlarmViewController_six.h"
#import "AppDelegate.h"
#import "Unitl.h"
#import "SetTHNAVController.h"

@interface SetAlarmViewController_six ()
{
    Unitl *u;
    NSArray *ls;
}
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIView *bgView2;

@end

@implementation SetAlarmViewController_six


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    u = [[Unitl alloc] init];
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;

    if (THEAPPDELEGATE.langId == 0) {
        _set_alarm_t1.text = THEAPPDELEGATE.sel_host_T;
        if ([THEAPPDELEGATE.sel_host_T isEqualToString:@"Temperature"]) {
            _set_alarm_t1.text = @"温度";
        }
        _set_alarm_t2.text = THEAPPDELEGATE.sel_host_V;
        if ([THEAPPDELEGATE.sel_host_V isEqualToString:@"Voltage"]) {
            _set_alarm_t2.text = @"电压";
        }
    }else{
        _set_alarm_t1.text = THEAPPDELEGATE.sel_host_T;
        _set_alarm_t2.text = THEAPPDELEGATE.sel_host_V;
    }
    
    NSLog(@"222sel_host_T = %@ - sel_host_H = %@ sel_host_V = %@ sel_host_AIN = %@",THEAPPDELEGATE.sel_host_T,THEAPPDELEGATE.sel_host_H,THEAPPDELEGATE.sel_host_V,THEAPPDELEGATE.sel_host_AIN);


    ls = @[_set_alarm_h1, _set_alarm_l1, _set_alarm_h2, _set_alarm_l2 ];

    UITapGestureRecognizer *tap;
    for (UILabel *l in ls) {
        [[l layer] setBorderWidth:1];//画线的宽度
        [[l layer] setBorderColor: THEAPPDELEGATE.borderColor.CGColor];//颜色

        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hLClick:)];
        [l addGestureRecognizer:tap];
    }
}

-(void)hLClick:(UIGestureRecognizer *)rec {
    if (rec.state == UIGestureRecognizerStateEnded) {
        THEAPPDELEGATE.sel_seiral = [NSString stringWithFormat:@"%ld", rec.view.tag];

        SetTHNAVController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"setth"];
        [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)set_alarm_ok1C:(id)sender {
    NSString *s = _set_alarm_t1.text;
    if (s == nil || s.length < 1) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"setAlarmTip", nil) preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
        return;
    }
    BOOL b = [u updateSETTING_Name:s index:1 phNum:THEAPPDELEGATE.sel_host_phNum];
    if (b) {
        THEAPPDELEGATE.sel_host_T = s;
        NSString *mg = [NSString stringWithFormat:@"%@AIN1T%@", THEAPPDELEGATE.sel_host_pwd, s];
        [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
    }
}

- (IBAction)set_alarm_ok3C:(id)sender {
    NSString *s = _set_alarm_t2.text;
    if (s == nil || s.length < 1) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"setAlarmTip", nil) preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
        return;
    }
    BOOL b = [u updateSETTING_Name:s index:3 phNum:THEAPPDELEGATE.sel_host_phNum];
    if (b) {
        THEAPPDELEGATE.sel_host_V = s;
        NSString *mg = [NSString stringWithFormat:@"%@AIN3T%@", THEAPPDELEGATE.sel_host_pwd, s];
        [THEAPPDELEGATE.mainV sendMsg:mg phNum:THEAPPDELEGATE.sel_host_phNum];
    }
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

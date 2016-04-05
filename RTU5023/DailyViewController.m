//
//  DailyViewController.m
//  S275
//
//  Created by paul on 16/3/20.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "DailyViewController.h"
#import "AppDelegate.h"

@interface DailyViewController (){
    NSMutableArray *hDatas, *mDatas;
}

@end

@implementation DailyViewController
AppDelegate *daily_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    daily_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = daily_app.bgColor;
    [[_daily_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_daily_bgV layer] setBorderColor: daily_app.borderColor.CGColor];//颜色
    [[_daily_bgV layer] setCornerRadius:15.0];//圆角
    [[_daily_bgV2 layer] setBorderWidth:1.5];//画线的宽度
    [[_daily_bgV2 layer] setBorderColor: daily_app.borderColor.CGColor];//颜色
    
    hDatas = [NSMutableArray new];
    mDatas = [NSMutableArray new];
    for (int i = 0; i< 24; i++) {
        if (i < 10) {
            [hDatas addObject:[NSString stringWithFormat:@"0%d", i]];
        }else{
            [hDatas addObject:[NSString stringWithFormat:@"%d", i]];
        }
        
    }
    for (int i = 0; i< 60; i++) {
        if (i < 10) {
            [mDatas addObject:[NSString stringWithFormat:@"0%d", i]];
        }else
            [mDatas addObject:[NSString stringWithFormat:@"%d", i]];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [hDatas count];
    }else{
        return [mDatas count];
    }
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *myView = nil;
     NSString *t = nil;
    if (component == 1) {
        t = [mDatas objectAtIndex:row];
    }else{
        t = [hDatas objectAtIndex:row];
    }
    myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 60, 15)];
    myView.textAlignment = NSTextAlignmentCenter;
    myView.text = t;
    myView.font = [UIFont systemFontOfSize:15];         //用label来设置字体大小
    myView.backgroundColor = [UIColor clearColor];
    return myView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return 30.0f;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 20.0f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)daily_addC:(id)sender {
 
    
    NSInteger row=[_daily_timePick selectedRowInComponent:0];
    NSString *h = [hDatas objectAtIndex:row];
    row=[_daily_timePick selectedRowInComponent:1];
    NSString *m = [mDatas objectAtIndex:row];
    
    NSString *msg = [NSString stringWithFormat:@"%@DRT%@:%@", daily_app.sel_host_pwd, h, m];
    [daily_app.mainV sendMsg:msg phNum:daily_app.sel_host_phNum];
}

- (IBAction)daily_delC:(id)sender {
  
    NSString *mg = NSLocalizedString(@"userTip3", nil);
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:mg preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"userAlerOkBtn", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *mg = [NSString stringWithFormat:@"%@DRTDEL", daily_app.sel_host_pwd];
        [daily_app.mainV sendMsg:mg phNum:daily_app.sel_host_phNum];
    }]];
    [ac addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"userAlerCanBtn", nil) style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:ac animated:YES completion:nil];
}

@end

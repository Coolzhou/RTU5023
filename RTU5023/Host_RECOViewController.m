//
//  Host_RECOViewController.m
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "Host_RECOViewController.h"
#import "AppDelegate.h"
@interface Host_RECOViewController (){
     NSMutableArray *datas;
}

@end

@implementation Host_RECOViewController
AppDelegate *host_reco_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    host_reco_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = host_reco_app.bgColor;
    [[_host_reco_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_host_reco_bgV layer] setBorderColor: host_reco_app.borderColor.CGColor];//颜色
    [[_host_reco_bgV layer]setCornerRadius:15.0];//圆角
    [[_host_reco_bgV2 layer] setBorderWidth:1.0];//画线的宽度
    [[_host_reco_bgV2 layer] setBorderColor: host_reco_app.borderColor.CGColor];//颜色
    [_host_reco_bgV sendSubviewToBack:_host_reco_bgV2];
    datas = [NSMutableArray new];
    for (int i = 1; i < 101; i++) {
        [datas addObject:[NSString stringWithFormat:@"%d", i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



- (IBAction)host_reco_okC:(id)sender {
    NSInteger row = [_host_reco_picker selectedRowInComponent:0];
    NSString *f = [datas objectAtIndex:row];

    
//    if (f.length == 1) {
//        f = [NSString stringWithFormat:@"00%@",f];
//    }else if(f.length == 2){
//        f = [NSString stringWithFormat:@"0%@",f];
//    }

    
    NSString *msg = [NSString stringWithFormat:@"%@HIS%@", host_reco_app.sel_host_pwd,f];
    [host_reco_app.mainV sendMsg:msg phNum:host_reco_app.sel_host_phNum];
}
@end

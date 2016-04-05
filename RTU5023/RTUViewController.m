//
//  RTUViewController.m
//  S275
//
//  Created by paul on 16/3/14.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "RTUViewController.h"
#import "AppDelegate.h"

@interface RTUViewController (){
    NSMutableArray *yDatas, *mDatas, *dDatas, *hDatas, *MDatas;
    int cur_y, cur_M, cur_d, cur_h, cur_mm;
    NSArray *pick1Datas;
}

@end

@implementation RTUViewController
AppDelegate *rtu_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.tag = 1;
    rtu_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = rtu_app.bgColor;
    
    [[_rtu_bgV layer] setBorderWidth:2.0];//画线的宽度
    [[_rtu_bgV layer] setBorderColor: rtu_app.borderColor.CGColor];//颜色
    [[_rtu_bgV layer]setCornerRadius:15.0];//圆角
    [[_rtu_bgV2 layer] setBorderWidth:1.5];//画线的宽度
    [[_rtu_bgV2 layer] setBorderColor: rtu_app.borderColor.CGColor];//颜色
    
    yDatas = [NSMutableArray new];
    MDatas = [NSMutableArray new];
    dDatas = [NSMutableArray new];
    hDatas = [NSMutableArray new];
    mDatas = [NSMutableArray new];

    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMdd"];
    NSDateFormatter  *dateformatter1 = [[NSDateFormatter alloc] init];
    [dateformatter1 setDateFormat:@"HHmmss"];
    NSString *y = [dateformatter stringFromDate:senddate];
    NSString *h = [dateformatter1 stringFromDate:senddate];
    cur_y = [[y substringWithRange:NSMakeRange(0,4)] intValue];
    cur_M = [[y substringWithRange:NSMakeRange(4,2)] intValue];
    cur_d = [[y substringWithRange:NSMakeRange(6,2)] intValue];
    
    cur_h = [[h substringWithRange:NSMakeRange(0,2)] intValue];
    cur_mm = [[h substringWithRange:NSMakeRange(2,2)] intValue];

    
    for (int i = 1971; i< 2100; i++) {
        [yDatas addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (int i = 1; i< 13; i++) {
        [MDatas addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (int i = 1; i< 32; i++) {
        [dDatas addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (int i = 0; i< 24; i++) {
        [hDatas addObject:[NSString stringWithFormat:@"%d", i]];
    }
    for (int i = 0; i< 60; i++) {
        [mDatas addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    pick1Datas =@[yDatas,MDatas, dDatas, hDatas, mDatas];
    
    [_rtu_timePick selectRow:cur_y - 1971 inComponent:0 animated:NO];
    [_rtu_timePick selectRow:cur_M - 1 inComponent:1 animated:NO];
    [_rtu_timePick selectRow:cur_d - 1 inComponent:2 animated:NO];
    [_rtu_timePick selectRow:cur_h inComponent:3 animated:NO];
    [_rtu_timePick selectRow:cur_mm inComponent:4 animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 1 || component == 0) {
        NSInteger row=[pickerView selectedRowInComponent:0];
        cur_y = [[yDatas objectAtIndex:row] intValue];
        NSInteger row1=[pickerView selectedRowInComponent:1];
        cur_M = [[MDatas objectAtIndex:row1] intValue];
        [_rtu_timePick reloadComponent:2];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return pick1Datas.count;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 2) {
        if (cur_M == 2 ) {
            if ([self bissextile:cur_y]) {
                return 29;
            }else{
                return 28;
            }
        }else{
            if (cur_M == 4 || cur_M == 6 || cur_M == 9 || cur_M == 11) { //
                return 30;
            }else{
                return 31;
            }
        }
    }else{
        NSArray *tmpa = [pick1Datas objectAtIndex:component];
        return [tmpa count];
    }
    
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *myView = nil;
   // int tag = (int)pickerView.tag;
    
    NSString *t = nil;
    t = [[pick1Datas objectAtIndex:component] objectAtIndex:row];
    myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 60, 20)];
    myView.textAlignment = NSTextAlignmentCenter;
    myView.text = t;
    myView.font = [UIFont systemFontOfSize:15];         //用label来设置字体大小
    myView.backgroundColor = [UIColor clearColor];
    return myView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int tag = (int)pickerView.tag;
    if (tag == 0) {
        return 40.0f;
    }
    return 30.0f;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 20.0f;
}

- (IBAction)rtu_okClick:(id)sender {
    NSInteger row=[_rtu_timePick selectedRowInComponent:0];
    cur_y = [[yDatas objectAtIndex:row] intValue];
    row=[_rtu_timePick selectedRowInComponent:1];
    cur_M = [[MDatas objectAtIndex:row] intValue];
    row=[_rtu_timePick selectedRowInComponent:2];
    cur_d = [[dDatas objectAtIndex:row] intValue];
    row=[_rtu_timePick selectedRowInComponent:3];
    cur_h = [[hDatas objectAtIndex:row] intValue];
    row=[_rtu_timePick selectedRowInComponent:4];
    cur_mm = [[mDatas objectAtIndex:row] intValue];
    
    NSString *cM = [NSString stringWithFormat:@"%d", cur_M];
    if (cM.length == 1) {
        cM = [NSString stringWithFormat:@"0%@", cM];
    }
    NSString *cd = [NSString stringWithFormat:@"%d", cur_d];
    if (cd.length == 1) {
        cd = [NSString stringWithFormat:@"0%@", cd];
    }
    NSString *ch = [NSString stringWithFormat:@"%d", cur_h];
    if (ch.length == 1) {
        ch = [NSString stringWithFormat:@"0%@", ch];
    }
    NSString *cmm = [NSString stringWithFormat:@"%d", cur_mm];
    if (cmm.length == 1) {
        cmm = [NSString stringWithFormat:@"0%@", cmm];
    }

    
    NSString *msg = [NSString stringWithFormat:@"%@D%d-%@-%@T%@:%@#", rtu_app.sel_host_pwd, cur_y, cM, cd, ch, cmm];
    [rtu_app.mainV sendMsg:msg phNum:rtu_app.sel_host_phNum];
}



-(BOOL)bissextile:(int)year {
    if ((year%4==0 && year %100 !=0) || year%400==0) {
        return YES;
    }else {
        return NO;
    }
    return NO;
}
@end

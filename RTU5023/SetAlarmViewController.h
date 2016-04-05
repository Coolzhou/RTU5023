//
//  SetAlarmViewController.h
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetAlarmViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *set_alarm_bgV;
@property (weak, nonatomic) IBOutlet UIView *set_alarm_bgV2;
@property (weak, nonatomic) IBOutlet UITextField *set_alarm_t1;
@property (weak, nonatomic) IBOutlet UITextField *set_alarm_t2;
@property (weak, nonatomic) IBOutlet UITextField *set_alarm_t3;
@property (weak, nonatomic) IBOutlet UILabel *set_alarm_h1;
@property (weak, nonatomic) IBOutlet UILabel *set_alarm_l1;
@property (weak, nonatomic) IBOutlet UILabel *set_alarm_h2;
@property (weak, nonatomic) IBOutlet UILabel *set_alarm_l2;
@property (weak, nonatomic) IBOutlet UILabel *set_alarm_h3;
@property (weak, nonatomic) IBOutlet UILabel *set_alarm_l3;
- (IBAction)set_alarm_ok1C:(id)sender;
- (IBAction)set_alarm_ok2c:(id)sender;
- (IBAction)set_alarm_ok3C:(id)sender;

@end

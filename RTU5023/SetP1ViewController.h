//
//  SetP1ViewController.h
//  S275
//
//  Created by paul on 16/3/10.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetP1ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *setP1_bgV;
@property (weak, nonatomic) IBOutlet UIView *setP1_bg2V;
@property (weak, nonatomic) IBOutlet UILabel *setP1_L1;
@property (weak, nonatomic) IBOutlet UILabel *setP1_L2;
@property (weak, nonatomic) IBOutlet UILabel *setP1_L3;
@property (weak, nonatomic) IBOutlet UILabel *setP1_L4;
@property (weak, nonatomic) IBOutlet UILabel *setP1_L5;
@property (weak, nonatomic) IBOutlet UILabel *setP1_L6;
@property (weak, nonatomic) IBOutlet UILabel *setP1_L7;
@property (weak, nonatomic) IBOutlet UILabel *setP1_L8;
@property (weak, nonatomic) IBOutlet UILabel *setP1_L9;

- (IBAction)setP1_SyncTimeClick:(id)sender;
- (IBAction)setP1_numClick:(id)sender;
- (IBAction)setP1_setClick:(id)sender;
- (IBAction)setP1_dailyClick:(id)sender;
- (IBAction)setP1_autoClick:(id)sender;
- (IBAction)setP1_languageClick:(id)sender;
- (IBAction)setP1_pwdClick:(id)sender;
- (IBAction)setP1_cycleClick:(id)sender;
- (IBAction)setP1_keyClick:(id)sender;

@end

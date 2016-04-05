//
//  RTUViewController.h
//  S275
//
//  Created by paul on 16/3/14.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTUViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *rtu_bgV;
@property (weak, nonatomic) IBOutlet UIView *rtu_bgV2;

@property (weak, nonatomic) IBOutlet UIPickerView *rtu_timePick;

- (IBAction)rtu_okClick:(id)sender;

@end

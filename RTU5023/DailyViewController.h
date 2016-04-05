//
//  DailyViewController.h
//  S275
//
//  Created by paul on 16/3/20.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *daily_bgV;
@property (weak, nonatomic) IBOutlet UIView *daily_bgV2;

@property (weak, nonatomic) IBOutlet UIPickerView *daily_timePick;
- (IBAction)daily_addC:(id)sender;
- (IBAction)daily_delC:(id)sender;

@end

//
//  CycleViewController.h
//  RTU5023
//
//  Created by paul on 2016/11/24.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *cycle_bgV;
@property (weak, nonatomic) IBOutlet UIView *cycle_bgV2;
@property (weak, nonatomic) IBOutlet UIPickerView *cycle_picket;
- (IBAction)cycke_okClick:(id)sender;

@end

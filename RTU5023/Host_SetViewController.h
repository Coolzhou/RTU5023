//
//  Host_SetViewController.h
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Host_SetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *host_set_bgV;
@property (weak, nonatomic) IBOutlet UIView *host_set_bgV2;
@property (weak, nonatomic) IBOutlet UITextField *host_set_t1;
@property (weak, nonatomic) IBOutlet UITextField *host_set_t2;
@property (weak, nonatomic) IBOutlet UITextField *host_set_t3;
- (IBAction)host_set_nameC:(id)sender;
- (IBAction)host_set_alarmC:(id)sender;

@end

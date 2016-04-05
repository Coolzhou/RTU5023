//
//  SetTHViewController.h
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetTHViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *set_th_bgV;
@property (weak, nonatomic) IBOutlet UIView *set_th_bgV2;
@property (weak, nonatomic) IBOutlet UITextField *set_th_L;
@property (weak, nonatomic) IBOutlet UITextField *set_th_H;
- (IBAction)set_th_okC:(id)sender;

@end

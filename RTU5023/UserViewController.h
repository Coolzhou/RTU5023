//
//  UserViewController.h
//  S275
//
//  Created by paul on 16/3/14.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *user_bgV;
@property (weak, nonatomic) IBOutlet UIView *user_bgV2;
@property (weak, nonatomic) IBOutlet UITextField *user_numText;
@property (weak, nonatomic) IBOutlet UIPickerView *user_picker;
- (IBAction)user_addClick:(id)sender;
- (IBAction)user_searchClick:(id)sender;
- (IBAction)user_delClick:(id)sender;

@end

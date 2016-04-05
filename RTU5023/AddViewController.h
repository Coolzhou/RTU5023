//
//  AddViewController.h
//  k3
//
//  Created by amttgroup on 16/2/17.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *addTitleL;
@property (weak, nonatomic) IBOutlet UIView *add_bgV;
@property (weak, nonatomic) IBOutlet UILabel *add_hostNameL;
@property (weak, nonatomic) IBOutlet UITextField *add_hostNameText;
@property (weak, nonatomic) IBOutlet UILabel *add_hostNumL;
@property (weak, nonatomic) IBOutlet UITextField *add_hostNumText;
@property (weak, nonatomic) IBOutlet UILabel *add_hostPWDL;
@property (weak, nonatomic) IBOutlet UITextField *add_hostPWDText;
@property (weak, nonatomic) IBOutlet UITextField *add_remarksText;
@property (weak, nonatomic) IBOutlet UILabel *add_saveBtnL;
- (IBAction)addBtnClink:(id)sender;
- (IBAction)selectTypeClick:(id)sender;

@end

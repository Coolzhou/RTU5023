//
//  AppPWDViewController.h
//  k3
//
//  Created by amttgroup on 16/2/17.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppPWDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *app_pwdTitleL;
@property (weak, nonatomic) IBOutlet UILabel *app_pwdOpenL;
@property (weak, nonatomic) IBOutlet UILabel *app_pwdCloseL;
@property (weak, nonatomic) IBOutlet UIImageView *app_pwdOpenSelIMG;
@property (weak, nonatomic) IBOutlet UIImageView *app_pwdCloseSelIMG;
- (IBAction)pwdOpenClick:(id)sender;
- (IBAction)pwdCloseClick:(id)sender;

@end

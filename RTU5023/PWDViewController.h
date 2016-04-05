//
//  PWDViewController.h
//  S275
//
//  Created by paul on 16/3/20.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PWDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *pwd_bgV;
@property (weak, nonatomic) IBOutlet UIView *pwd_bgV2;
@property (weak, nonatomic) IBOutlet UITextField *pwd_oldPT;
@property (weak, nonatomic) IBOutlet UITextField *pwd_newPT;

- (IBAction)pwd_okClick:(id)sender;

@end

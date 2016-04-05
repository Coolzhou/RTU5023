//
//  AutoViewController.h
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *auto_bgV;
@property (weak, nonatomic) IBOutlet UIView *auto_bgV2;
@property (weak, nonatomic) IBOutlet UIPickerView *auto_picker;
- (IBAction)auto_okC:(id)sender;

@end

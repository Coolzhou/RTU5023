//
//  Host_RECOViewController.h
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Host_RECOViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *host_reco_bgV;
@property (weak, nonatomic) IBOutlet UIView *host_reco_bgV2;
@property (weak, nonatomic) IBOutlet UIPickerView *host_reco_picker;
- (IBAction)host_reco_okC:(id)sender;

@end

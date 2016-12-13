//
//  HostViewController.h
//  S275
//
//  Created by paul on 16/3/9.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HostViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *host_bgV;
@property (weak, nonatomic) IBOutlet UIView *host_phoneV;
@property (weak, nonatomic) IBOutlet UIView *host_relayV;
@property (weak, nonatomic) IBOutlet UIView *host_ainV;
@property (weak, nonatomic) IBOutlet UIView *host_lockV;
@property (weak, nonatomic) IBOutlet UIView *host_unLockV;
@property (weak, nonatomic) IBOutlet UIView *host_onlineV;
@property (weak, nonatomic) IBOutlet UIView *host_statusV;
@property (weak, nonatomic) IBOutlet UIView *host_pulseV;
@property (weak, nonatomic) IBOutlet UIView *host_rebootV;
@property (weak, nonatomic) IBOutlet UIView *host_cycleV;
@property (weak, nonatomic) IBOutlet UIView *host_keyV;
- (IBAction)hostPhoneClick:(id)sender;
- (IBAction)hostRelayClick:(id)sender;
- (IBAction)hostAINClick:(id)sender;
- (IBAction)hostLockClick:(id)sender;
- (IBAction)hostUnlockClick:(id)sender;
- (IBAction)hostOnlineClick:(id)sender;
- (IBAction)hostStatusClick:(id)sender;
- (IBAction)hostPulseClick:(id)sender;
- (IBAction)hostRebootClick:(id)sender;
- (IBAction)hostCycleClick:(id)sender;
- (IBAction)hostKeyClick:(id)sender;

@end

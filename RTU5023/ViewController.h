//
//  ViewController.h
//  k3
//
//  Created by amttgroup on 16/2/16.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController<MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleL2;
@property (weak, nonatomic) IBOutlet UITableView *mainTalbe;
@property (weak, nonatomic) IBOutlet UILabel *addBtnL;
- (IBAction)addHostClick:(id)sender;
-(void)toScanPwdPage;
-(void)sendMsg:(NSString*)msg phNum:(NSString*)number;

@end


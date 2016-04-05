//
//  ViewController.m
//  k3
//
//  Created by amttgroup on 16/2/16.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Unitl.h"
#import "AddNavigationController.h"
#import "AppPWDNavigationController.h"
#import "SetPWDNavigationController.h"
#import "HostNavigationController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController (){
    Unitl *u;
    NSMutableArray *hostACs;
    UILabel *leftL;
}

@end

@implementation ViewController

AppDelegate *app;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    app = [[UIApplication sharedApplication] delegate];
    u = [Unitl new];
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    NSLog( @"currentLanguage %@" , currentLanguage);
    
    if ([currentLanguage hasPrefix:@"zh-"]) {
        app.langId = 0;
    }else
        app.langId = 1;//英文取消
    self.view.backgroundColor = app.bgColor;
    app.isAddHost = YES;
    app.mainV = self;
    
    _mainTalbe.separatorStyle = UITableViewCellSeparatorStyleNone;//去掉每一行的分割线。
    _titleL2.text = NSLocalizedString(@"titleL2", nil);
    _addBtnL.text = NSLocalizedString(@"btnL", nil);
    
    self.navigationItem.title = NSLocalizedString(@"titleL", nil);
    
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,60,30)];
    [rightButton setImage:[UIImage imageNamed:@"savebtn.png"]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(pwdClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0,-1,60,30)];
    [l setText:NSLocalizedString(@"nBtnRL", nil)];
    [l setTextColor:[UIColor whiteColor]];
    [l setFont:[UIFont systemFontOfSize:13.0f]];
    [l setTextAlignment:NSTextAlignmentCenter];
    [rightItem.customView addSubview:l];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    UIButton *liftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,60,30)];
    [liftButton setImage:[UIImage imageNamed:@"savebtn.png"]forState:UIControlStateNormal];
    [liftButton addTarget:self action:@selector(editClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *liftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:liftButton];
    leftL = [[UILabel alloc] initWithFrame:CGRectMake(0,-1,60,30)];
    [leftL setText:NSLocalizedString(@"nBtnLL1", nil)];
    [leftL setTextColor:[UIColor whiteColor]];
    [leftL setFont:[UIFont systemFontOfSize:13.0f]];
    [leftL setTextAlignment:NSTextAlignmentCenter];
    [liftButtonItem.customView addSubview:leftL];
    self.navigationItem.leftBarButtonItem= liftButtonItem;
    
    NSDictionary *d = [u getAPPSet];
    if (d != nil) {
        app.isSetAppPwd = [[d objectForKey:@"isSet"] intValue];
        app.appPWD = [d objectForKey:@"app_pwd"];
        if (app.isSetAppPwd) {
            [self toScanPwdPage];
        }
    }else{
        app.isSetAppPwd = NO;
        app.appPWD = @"";
    }

}

-(void)toScanPwdPage {
    SetPWDNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"setPWD"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
}

-(void)editClick {
    if(hostACs.count <= 0)
        return;
    if (app.isAddHost) {
        app.isAddHost = NO;
        [leftL setText:NSLocalizedString(@"nBtnLL2", nil)];
    }else{
        app.isAddHost = YES;
        [leftL setText:NSLocalizedString(@"nBtnLL1", nil)];
    }
}

-(void)pwdClick {
    AppPWDNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"pwd"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
}


-(void)viewWillAppear:(BOOL)animated {
    if (app.isAddHost) {
        [leftL setText:NSLocalizedString(@"nBtnLL1", nil)];
    }else{
        [leftL setText:NSLocalizedString(@"nBtnLL2", nil)];
    }
    
    NSDictionary *data = [u getLocalHostACCJson];
    hostACs = [data objectForKey:@"hosts"];
    [_mainTalbe reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addHostClick:(id)sender {
    if (!app.isAddHost) {
        [leftL setText:NSLocalizedString(@"nBtnLL1", nil)];
    }
    app.isAddHost = YES;
    AddNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"add"];
    [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    app.sel_host_phNum = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"host_number"];
    app.sel_host_name = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"host_name"];
    app.sel_host_pwd = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"host_pwd"];
    app.sel_host_remarks = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"remarks"];
    app.sel_host_type = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"type"];
    
    app.sel_host_T = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"host_t"];
    app.sel_host_H = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"host_h"];
    app.sel_host_V = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"host_v"];

    
    if (!app.isAddHost) {//是编辑模式下
        AddNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"add"];
        [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    }else{//不是编辑模式下
        HostNavigationController *hnc =   [self.storyboard instantiateViewControllerWithIdentifier:@"host"];
        [self.navigationController pushViewController:hnc.visibleViewController animated:YES];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return hostACs.count; // or items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 55.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * showUserInfoCellIdentifier = @"mainTableViewCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil){
        // Create a cell to display an ingredient.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:showUserInfoCellIdentifier];
    }
    
    [[cell layer] setBorderWidth:1.0];//画线的宽度
    [[cell layer] setBorderColor: app.borderColor.CGColor];//颜色
    [[cell layer]setCornerRadius:8.0];//圆角
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.text = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"host_name"];
    cell.detailTextLabel.text = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"remarks"];
    BOOL b = NO;
    UILabel *tl;
    for (UIView *v in cell.contentView.subviews) {
        if (v.tag == 88) {
            b = YES;
            tl = (UILabel*)v;
            break;
        }
    }
    
    if (b) {
        tl.text = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"type"];
    }else{
        tl = [[UILabel alloc] init];
        tl.tag = 88;
        tl.font = [UIFont systemFontOfSize:10];
        tl.textAlignment = NSTextAlignmentRight;
        tl.text = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"type"];
        [cell.contentView addSubview:tl];
        [tl setTranslatesAutoresizingMaskIntoConstraints:NO];
        UIView *superView=tl.superview;
        
        NSLayoutConstraint *topContraint=[NSLayoutConstraint
                                          constraintWithItem:tl
                                          attribute:NSLayoutAttributeTop
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:superView
                                          attribute:NSLayoutAttributeTop
                                          multiplier:1.0f
                                          constant:17.0];
        NSLayoutConstraint *tContraint=[NSLayoutConstraint
                                        constraintWithItem:tl
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:superView
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0f
                                        constant:0.0];
        NSLayoutConstraint *wContraint=[NSLayoutConstraint
                                        constraintWithItem:tl
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeWidth
                                        multiplier:1.0f
                                        constant:52.0f];
        NSLayoutConstraint *hContraint=[NSLayoutConstraint
                                        constraintWithItem:tl
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                        attribute:NSLayoutAttributeHeight
                                        multiplier:1.0f
                                        constant:20.0f];
        [superView addConstraints:@[tContraint, topContraint, wContraint, hContraint]];
    }
    
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return NSLocalizedString(@"delBtnL",nil);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *num = [[hostACs objectAtIndex:indexPath.row] objectForKey:@"host_number"];
        BOOL b = [u delHostByphNum:num];
        if (!b) {
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"delTip", nil) preferredStyle:UIAlertControllerStyleAlert];
            [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]];
            
            [self presentViewController:ac animated:YES completion:nil];
            return;
        }
        [hostACs removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        [_mainTalbe deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
}

-(void)sendMsg:(NSString*)msg phNum:(NSString*)number
{
    if( [MFMessageComposeViewController canSendText] ){
        
        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc]init]; //autorelease];
        controller.recipients = [NSArray arrayWithObject:number];
        controller.body = msg;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
        
        [[[[controller viewControllers] lastObject] navigationItem] setTitle:@"GSM SMS"];//修改短信界面标题
    }else{
        
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"smsTip1", nil) preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:ac animated:YES completion:nil];
    }
    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
    [controller dismissViewControllerAnimated:NO completion:nil];//关键的一句   不能为YES
    switch ( result ) {
            
        case MessageComposeResultCancelled:
            
            NSLog(@"发送取消");
            break;
        case MessageComposeResultFailed:// send failed
        {
            NSLog(@"发送失败");
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"smsTip2", nil) preferredStyle:UIAlertControllerStyleAlert];
            [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:ac animated:YES completion:nil];
        }
            
            break;
        case MessageComposeResultSent:
        {
            NSLog(@"发送成功");
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"" message:NSLocalizedString(@"smsTip3", nil) preferredStyle:UIAlertControllerStyleAlert];
            [ac addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:ac animated:YES completion:nil];
            
        }
            break;
        default:
            break;
    }
}


@end

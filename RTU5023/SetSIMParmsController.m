//
//  SetSIMParmsController.m
//  RTU5023
//
//  Created by zhou on 2018/7/29.
//  Copyright © 2018年 paul. All rights reserved.
//

#import "SetSIMParmsController.h"

@interface SetSIMParmsController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *bgView2;

@end

@implementation SetSIMParmsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = THEAPPDELEGATE.bgColor;
    
    self.bgView.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
    self.bgView2.layer.borderColor = THEAPPDELEGATE.borderColor.CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

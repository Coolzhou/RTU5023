//
//  TypeViewController.h
//  S275
//
//  Created by paul on 16/3/7.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TypeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *type_bgV;
@property (weak, nonatomic) IBOutlet UIImageView *sel270Img;

- (IBAction)rtu270SelClick:(id)sender;
- (IBAction)typeSaveClick:(id)sender;

@end

//
//  LanguageViewController.h
//  RTU5023
//
//  Created by paul on 16/4/4.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *language_bgV;
@property (weak, nonatomic) IBOutlet UIView *language_bgV2;
@property (weak, nonatomic) IBOutlet UILabel *language_cl;
@property (weak, nonatomic) IBOutlet UILabel *language_el;
- (IBAction)language_cnC:(id)sender;
- (IBAction)language_enC:(id)sender;
- (IBAction)language_okC:(id)sender;

@end

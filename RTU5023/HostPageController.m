//
//  HostPageController.m
//  k3
//
//  Created by amttgroup on 16/2/18.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "HostPageController.h"
#import "AppDelegate.h"
#import "HostViewController.h"
#import "SetP1ViewController.h"
//#import "SetP2ViewController.h"
//#import "SetP3ViewController.h"

@interface HostPageController (){
    NSArray *pages;
}

@end

@implementation HostPageController
AppDelegate *page_app;

- (void)viewDidLoad {
    [super viewDidLoad];
    page_app = [[UIApplication sharedApplication] delegate];
    self.view.backgroundColor = page_app.bgColor;
    HostViewController *v1 = [self.storyboard instantiateViewControllerWithIdentifier:@"hostV"];
    SetP1ViewController *v2 = [self.storyboard instantiateViewControllerWithIdentifier:@"set1V"];
//    SetP2ViewController *v3 = [self.storyboard instantiateViewControllerWithIdentifier:@"set2V"];
//    SetP3ViewController *v4 = [self.storyboard instantiateViewControllerWithIdentifier:@"setV3"];
    pages = @[v1,v2];

    self.dataSource = self;
    [self setViewControllers:@[v1] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:102.0/255.0 green:195.0/255.0 blue:238.0/255.0 alpha:1];
    pageControl.backgroundColor = page_app.bgColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if ((index == -1) || index == pages.count) {
        return nil;
    }
    
    return (UIViewController *)pages[index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return pages.count;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

#pragma mark -- pageviewcontroller的dataSource代理方法
//移动前的conrtoller
-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController*)viewController{
    int index  = (int)viewController.view.tag;
    if((index == -1) || (index == NSNotFound)){
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

//到移动后的页面
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    int index  = (int)viewController.view.tag;
    
    if(index == NSNotFound){
        return nil;
    }
    index++;
    if (index == [pages count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

@end

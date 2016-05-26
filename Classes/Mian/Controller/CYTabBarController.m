//
//  CYTabBarController.m
//  CYQQ
//
//  Created by jeader on 16/5/25.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYTabBarController.h"

#import "CYContactsViewController.h"
#import "CYDynamicViewController.h"
#import "CYMessageViewController.h"

#import "CYTabBar.h"
#import "Header.h"

@interface CYTabBarController ()

@end

@implementation CYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加子控制器
    [self addChildViewControllers];
    
    // 默认选中第一个子控制器
    self.selectedIndex = 0;
    
    // 设置tabBar
    [self setUpTabBar];
    
}

-(void)addChildViewControllers
{
    // 消息
    CYMessageViewController *messageVc = [[CYMessageViewController alloc] init];
    [self addChildViewController:messageVc];
    
    // 联系人
    CYContactsViewController *contactsVc = [[CYContactsViewController alloc] init];
    [self addChildViewController:contactsVc];
    
    // 动态
    CYDynamicViewController *dynamicVc = [[CYDynamicViewController alloc] init];
    [self addChildViewController:dynamicVc];
    
}

-(void)setUpTabBar
{
    // 先隐藏自带的tabBar
    self.tabBar.hidden = YES;
    // 添加自己的tabBar
    CYTabBar *tabBar = [[CYTabBar alloc] initWithControllerNameArray:@[@"消息",@"联系人",@"动态"]];
    tabBar.imageArr = @[@"message_normal",@"contacts_normal",@"dynamic_normal"];
    tabBar.selectImageArr = @[@"message_select",@"contacts_select",@"dynamic_select"];
    [self.view addSubview:tabBar];
    
    // tabbar的点击
    [tabBar tabBarButtonClick:^(NSInteger index) {
        self.selectedIndex = index;
    }];
}

@end

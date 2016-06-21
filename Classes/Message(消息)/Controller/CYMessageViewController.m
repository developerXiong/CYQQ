//
//  CYMessageViewController.m
//  CYQQ
//
//  Created by jeader on 16/5/25.
//  Copyright © 2016年 jeader. All rights reserved.
//  RongCloud AppKey: bmdehs6pdpq6s
// RongCloud AppSecret: oIhmLqft7m

#import "CYMessageViewController.h"

#import "Header.h"

#import <RongIMKit/RongIMKit.h>

#define AppKey @"bmdehs6pdpq6s" // 融云
#define AppSecret @"oIhmLqft7m" // 融云

@interface CYMessageViewController ()

@end

@implementation CYMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    [self addGesture];
    
    // 初始化融云SDK
    [[RCIM sharedRCIM] initWithAppKey:AppKey];
    
    // 连接服务器
    [[RCIM sharedRCIM] connectWithToken:@"" success:^(NSString *userId) {
        NSLog(@"登陆成功。当前的用户ID：%@",userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆错误：%ld", (long)status);
    } tokenIncorrect:^{
        // token过期或者不正确
        // 如果设置了token有效期并且过期，请重新请求服务器获取新的token
        // 如果没有设置token有效期却提示错误，请检查客户端和服务器的appkey是否匹配，还有检查获取token的流程
        NSLog(@"RongCloud token error!");
        
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setFrame:CGRectMake(50, 80, 100, 44)];
    [button setTitle:@"聊天界面" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(chatWith) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)chatWith
{
    // 新建一个聊天会话View controller 对象
    RCConversationViewController *chat = [[RCConversationViewController alloc] init];
    // 设置会话的类型，如：单聊、讨论组、群聊、聊天室、客服、公众服务会话等
    chat.conversationType = ConversationType_PRIVATE;
    // 设置会话的目标会话ID。（单聊、客服、公众服务会话为对方ID，讨论组、群聊、聊天室为会话的ID）
    chat.targetId = @"targetIdYouWillChatIn";
    // 设置聊天界面显示的标题
    chat.title = @"聊天";
    // 显示聊天会话界面
    [self.navigationController pushViewController:chat animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

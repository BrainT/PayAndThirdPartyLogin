//
//  AppDelegate.h
//  ThirdLoginAndPay
//
//  Created by iOSDev on 16-4-18.
//  Copyright (c) 2016年 iOSDev. All rights reserved.
//
#define APP_ID  @"应用注册微信的App_ID"
#import "WXApi.h"
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;


@end


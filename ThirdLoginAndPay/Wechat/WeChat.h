//
//  WeChat.h
//  ThirdLoginAndPay
//
//  Created by iOSDev on 16-4-19.
//  Copyright (c) 2016年 iOSDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"

@interface WeChat : UIViewController
/**
 *   @author iOSDev
 *
 *   WeChatPay API
 *
 *   @return
 */
#pragma mark - WeChat支付
+ (void)WeChatPayWithUrl:(NSString *)urlString;

@end

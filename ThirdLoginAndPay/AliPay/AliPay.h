//
//  AliPay.h
//  ThirdLoginAndPay
//
//  Created by iOSDev on 16-4-19.
//  Copyright (c) 2016年 iOSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AliPay : UIViewController
/**
 *   @author iOSDev
 *
 *   AliPayAPI
 *
 *   @param Order_NO    订单号
 *   @param productName 订单名
 *   @param productDes  订单描述
 *   @param amount      金额
 *   @param notifyURL   回调URL
 */
+ (void)AliPayWithTradeNumber:(NSString *)Order_NO WithProductName:(NSString *)productName withProductDescription:(NSString *)productDes withAmount:(NSString *)amount withNotifyURL:(NSString *)notifyURL;

@end

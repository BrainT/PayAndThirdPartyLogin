//
//  Header-prefix.h
//  ThirdLoginAndPay
//
//  Created by iOSDev on 16-4-19.
//  Copyright (c) 2016年 iOSDev. All rights reserved.
//

#ifndef ThirdLoginAndPay_Header_prefix_h
#define ThirdLoginAndPay_Header_prefix_h

#import <Availability.h>
#ifndef __IPHONE_5_0
#warning "This project uses features only available in iOS SDK 5.0 and later."
#endif

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#endif
//一般由客户提供
#define  Ali_partner  @"应用在支付宝平台上的参数"
#define  Ali_Seller @"应用在支付宝平台上的参数"
#define  Ali_PrivateKey  @"应用在支付宝平台上的参数"

#endif

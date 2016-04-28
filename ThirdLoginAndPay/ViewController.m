//
//  ViewController.m
//  ThirdLoginAndPay
//
//  Created by iOSDev on 16-4-18.
//  Copyright (c) 2016年 iOSDev. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"
#import "AliPay.h"
#import "WeChat.h"
#import "AFHTTPRequestOperationManager.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "WeiboSDK.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
#pragma mark - AliPay
- (IBAction)AliPayClicked:(id)sender {
    
    [AliPay AliPayWithTradeNumber:@"201604190001" WithProductName:@"AliPay测试" withProductDescription:@"AliPay测试描述" withAmount:@"0.01" withNotifyURL:@"http://jcb.wd900.com/alipay_notify_url.aspx"];
    
}
#pragma mark - WeChatPay
- (IBAction)WeChatPayClicked:(id)sender {
    NSString * urlString = [NSString stringWithFormat:@"http://jcb.wd900.com/csapi/wxpay1.ashx?total_fee=%@&orderbh=%@",@1 ,@201604180002];

    [WeChat WeChatPayWithUrl:urlString];
    
}
#pragma mark - QQLogin
- (IBAction)QQLoginClicked:(id)sender {
     [self getUserInfo:SSDKPlatformTypeQQ];
}
#pragma mark - WeChatLogin
- (IBAction)WeChatLoginCliked:(id)sender {
    [self getUserInfo:SSDKPlatformTypeWechat];
}
#pragma mark - SinaWeiboLogin
- (IBAction)SinaWeiboClicked:(id)sender {
    [self getUserInfo:SSDKPlatformTypeSinaWeibo];
}
#pragma mark - third登录
-(void) getUserInfo: (NSUInteger) PlatformType
{
    [ShareSDK getUserInfo:PlatformType
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             NSLog(@"platformType=%i",user.platformType);
             [self thirdLogin:user];
         }
         else
         {
             NSLog(@"%@",error);
         }
         
     }];
}
-(void) thirdLogin:(SSDKUser *)ssuser
{
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    NSString * action;
    if (ssuser.platformType==SSDKPlatformTypeWechat) {
        
        
        action=@"login_weixin.ashx";
        
        params[@"weixin_id"]=ssuser.uid;
        
    }else if (ssuser.platformType==SSDKPlatformTypeQQ)
    {
        
        action=@"login_qq.ashx";
        
        params[@"qq_id"]=ssuser.uid;
    }else if (ssuser.platformType==SSDKPlatformTypeSinaWeibo)
    {
        
        action=@"login_weibo.ashx";
        
        params[@"weibo_id"]=ssuser.uid;
    }
    
    
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    
    
    NSString *urlString=[NSString stringWithFormat:@"%@/%@",@"http://jcb.wd900.com/csapi",action];
    params[@"key"]=@"jiufen";
    
    [mgr POST: urlString parameters:params success:^(AFHTTPRequestOperation *operation, NSMutableDictionary *responseObject)
     {
         NSLog(@"----%@",responseObject);
         
         if ([@"y" isEqualToString:responseObject[@"status"]])
         {
             [[[UIAlertView alloc] initWithTitle:@"" message:@"登录成功" delegate:self cancelButtonTitle:@"确认" otherButtonTitles: nil] show];
             
             [self.navigationController popViewControllerAnimated:true];
             
             [self dismissViewControllerAnimated:true completion:nil];
         }else [[[UIAlertView alloc] initWithTitle:@"" message:responseObject[@"info"] delegate:self cancelButtonTitle:@"确认" otherButtonTitles: nil] show];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
         
     }];
    
    
}
#pragma mark - AliPay
- (void)AliPayClicked
{
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

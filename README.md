# PayAndThirdPartyLogin
AliPay、wechatPay、ThirdLogin
本例提供的是集成了ShareSDK登录（QQ，Wechat，SinaWeibo），AliPay，WechatPay的工程，工程中的注释可能不是很到位，会继续完善的。
1.为AliPay，WechatPay封装了接口，传入对应的参数即可完成支付。AliPay可以调网页，wechatPay由于Wechat的机制决定，现在无法进行web支付，只能在安装
wechat下才能支付。
2.提供的三个常用登录平台，各个平台的APPID/Key,Appsecret等参数由客户提供或者自己申请（有点繁琐，需审核通过才能正常使用）。

//
//  ViewController.m
//  Login_Demo iOS
//
//  Created by Garin on 15/9/10.
//  Copyright (c) 2015年 wilddog. All rights reserved.
//

#import "ViewController.h"
#import <Wilddog/Wilddog.h>

//#import "WXApi.h"
//#import "WeiboSDK.h"
//#import <TencentOpenAPI/TencentOAuth.h>

typedef NS_ENUM(NSUInteger,AlertType){
    QQ,
    WEIXIN,
    WEIBO,
    ANONYMOUSE
};

@interface ViewController ()  //<TencentSessionDelegate>
{
//    TencentOAuth *_tencentOAuth;
//    NSArray *_permissions;
}
@property (weak, nonatomic) IBOutlet UIButton *QQLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *weixinLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *weiboLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) IBOutlet UILabel *loginStatusLabel;
@property (weak, nonatomic) IBOutlet UIButton *anonymousLoginButton;

@property (nonatomic, strong) Wilddog *ref;

// A dialog that is displayed while logging in
@property (nonatomic, strong) UIAlertView *loginProgressAlert;

// The user currently authenticed with Wilddog
@property (nonatomic, strong) WAuthData *currentUser;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ref = [[Wilddog alloc] initWithUrl:kWilddogURL];
    
    // setup views
    self.loginStatusLabel.hidden = YES;
    self.loginStatusLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.loginStatusLabel.numberOfLines = 0;
    self.logoutButton.hidden = YES;
    
    
    // 登录方式
    [self.QQLoginButton addTarget:self
                                 action:@selector(QQButtonPressed)
                       forControlEvents:UIControlEventTouchUpInside];
    [self.weixinLoginButton addTarget:self
                                action:@selector(weixinButtonPressed)
                      forControlEvents:UIControlEventTouchUpInside];
    [self.weiboLoginButton addTarget:self
                               action:@selector(weiboButtonPressed)
                     forControlEvents:UIControlEventTouchUpInside];
    [self.anonymousLoginButton addTarget:self
                                  action:@selector(anonymousButtonPressed)
                        forControlEvents:UIControlEventTouchUpInside];
    [self.logoutButton addTarget:self
                          action:@selector(logoutButtonPressed)
                forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)showEmptyAlertMessage:(AlertType)type
{
    NSString *typeString = [NSString string];
    switch (type) {
        case 0:
            typeString = @"“QQ登录”";
            break;
        case 1:
            typeString = @"“微信登录”";
            break;
        case 2:
            typeString = @"“微博登录”";
            break;
        default:
            break;
    }
    NSString *alertString = [NSString stringWithFormat:@"请按本工程注释方式 %@",typeString];
    UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:@"提示" message:alertString delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alterView show];
}

#pragma mark - QQ登录
- (void)QQButtonPressed
{
    [self showEmptyAlertMessage:QQ];
//    _tencentOAuth = [[TencentOAuth alloc]initWithAppId:@"1234567890" andDelegate:self];
//    _permissions = [NSArray arrayWithObjects:@"get_user_info", @"get_simple_userinfo", @"add_t", nil];
//    [_tencentOAuth authorize:_permissions inSafari:NO];
}

//登录成功：
- (void)tencentDidLogin
{
//    [self.ref authWithOAuthProvider:@"qq" parameters:@{@"access_token":_tencentOAuth.accessToken,@"openId":_tencentOAuth.openId} withCompletionBlock:^(NSError *error, WAuthData *authData) {
//        
//        
//    }];
}

//非网络错误导致登录失败：
-(void)tencentDidNotLogin:(BOOL)cancelled
{
    
}
//网络错误导致登录失败：
-(void)tencentDidNotNetWork
{
    
}

#pragma mark - 微信登录
- (void)weixinButtonPressed
{
    [self showEmptyAlertMessage:WEIXIN];
//    if ([WXApi isWXAppInstalled] == NO) {
//        UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"安装微信客户端后才可以登录" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"安装", nil];
//        [alterView show];
//        return;
//    }
//    SendAuthReq* req =[[SendAuthReq alloc] init];
//    req.scope = @"snsapi_userinfo" ;
//    req.state = @"123";
//    //第三方向微信终端发送一个SendAuthReq消息结构
//    [WXApi sendReq:req];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    if (buttonIndex == 1) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[WXApi getWXAppInstallUrl]]];
//    }
}

#pragma mark - 微博登陆
- (void)weiboButtonPressed
{
    [self showEmptyAlertMessage:WEIBO];
//    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
//    request.redirectURI = @"https://api.weibo.com/oauth2/default.html";
//    request.scope = @"email,direct_messages_write";
//    request.userInfo = @{@"SSO_From": @"WDLoginViewController",
//                         @"Other_Info_1": [NSNumber numberWithInt:123], @"Other_Info_2": @[@"obj1", @"obj2"],
//                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
//    [WeiboSDK sendRequest:request];
}

#pragma mark - 匿名登录
- (void)anonymousButtonPressed
{
    //匿名登录需要在 网页端--控制面板--终端用户认证--匿名登录--勾选“允许终端用户匿名登录”
    if([self wilddogIsSetup]){
        [self showProgressAlert];
        [self.ref authAnonymouslyWithCompletionBlock:[self loginBlockForProviderName:@"Anonymous"]];
    }
}

#pragma mark - 退出登录
- (void)logoutButtonPressed
{
    // logout of Wilddog and set the current user to nil
    [self.ref unauth];
    [self updateUIAndSetCurrentUser:nil];
}

#pragma mark -
- (void)showProgressAlert
{
    // show an alert notifying the user about logging in
    self.loginProgressAlert = [[UIAlertView alloc] initWithTitle:nil
                                                         message:@"正在登录..." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [self.loginProgressAlert show];
}

- (void(^)(NSError *,WAuthData *))loginBlockForProviderName:(NSString *)providerName
{
    // this callback block can be used for every login method
    return ^(NSError *error, WAuthData *authData){
        // hide the login progress dialog
        [self.loginProgressAlert dismissWithClickedButtonIndex:0 animated:YES];
        self.loginProgressAlert = nil;
        if (error != nil) {
            // there was an error authenticating with Wilddog
            NSLog(@"Error logging in to Wilddog: %@", error);
            // display an alert showing the error message
            NSString *message = [NSString stringWithFormat:@"There was an error logging into Wilddog using %@: %@",
                                 providerName,
                                 [error localizedDescription]];
            [self showErrorAlertWithMessage:message];
        } else {
            // all is fine, set the current user and update UI
            [self updateUIAndSetCurrentUser:authData];
        }
    };
}

- (BOOL)wilddogIsSetup
{
    if ([@"https://<your-wilddog-app>.wilddogio.com" isEqualToString:kWilddogURL]) {
        [self showErrorAlertWithMessage:@"请先设置您的 kWilddogURL"];
        return NO;
    } else {
        return YES;
    }
}


// sets the user and updates the UI
- (void)updateUIAndSetCurrentUser:(WAuthData *)currentUser
{
    // set the user
    self.currentUser = currentUser;
    if (currentUser == nil) {
        // The is no user authenticated, so show the login buttons and hide the logout button
        self.loginStatusLabel.hidden = YES;
        self.logoutButton.hidden = YES;
        self.QQLoginButton.hidden = NO;
        self.weixinLoginButton.hidden = NO;
        self.weiboLoginButton.hidden = NO;
        self.anonymousLoginButton.hidden = NO;
    } else {
        // update the status label to show which user is logged in using which provider
        NSString *statusText;
        if ([currentUser.provider isEqualToString:@"qq"]) {
            statusText = [NSString stringWithFormat:@"Logged in as %@ (QQ)",
                          currentUser.providerData[@"username"]];
        } else if ([currentUser.provider isEqualToString:@"weixin"]) {
            statusText = [NSString stringWithFormat:@"Logged in as %@ (weixin)",
                          currentUser.providerData[@"username"]];
        } else if ([currentUser.provider isEqualToString:@"weibo"]) {
            statusText = [NSString stringWithFormat:@"Logged in as %@ (weibo)",
                          currentUser.providerData[@"username"]];
        } else if ([currentUser.provider isEqualToString:@"anonymous"]) {
            statusText = @"Logged in anonymously";
        } else {
            statusText = [NSString stringWithFormat:@"Logged in with unknown provider"];
        }
        self.loginStatusLabel.text = statusText;
        self.loginStatusLabel.hidden = NO;
        // show the logout button
        self.logoutButton.hidden = NO;
        // hide the login button for now
        self.QQLoginButton.hidden = YES;
        self.weixinLoginButton.hidden = YES;
        self.weiboLoginButton.hidden = YES;
        self.anonymousLoginButton.hidden = YES;
    }
}

- (void)showErrorAlertWithMessage:(NSString *)message
{
    // display an alert with the error message
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

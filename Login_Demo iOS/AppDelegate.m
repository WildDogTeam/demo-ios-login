//
//  AppDelegate.m
//  Login_Demo iOS
//
//  Created by Garin on 15/9/10.
//  Copyright (c) 2015年 wilddog. All rights reserved.
//

#import "AppDelegate.h"
#import <Wilddog/Wilddog.h>


//引入登录第三方库
//#import "WXApi.h"
//#import "WeiboSDK.h"
//#import <TencentOpenAPI/TencentOAuth.h>


// The Wilddog you want to use for this app
// You must setup Wilddog Login for the various authentication providers in the Dashboard under Login & Auth.

@interface AppDelegate () //<WXApiDelegate,WeiboSDKDelegate>

// The Wilddog object. We use this to authenticate.
@property (nonatomic, strong) Wilddog *ref;
@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    //***Login 步骤***
    
    //第一步：打开www.wilddog.com ———— 登录 ———— 创建您的app
    
    //第二步：管理应用 ———— 终端用户认证 ———— 社交账号登录 ———— 填写相关信息
    
    //第三步：在xcode集成您需要的第三方登录SDK（QQ、weixin、weibo）
    
    //第四步：在第三方登录成功的代理方法中，填写Wilddog的oAuth方法登录  - (void)authWithOAuthProvider:(NSString *)provider parameters:(NSDictionary *)parameters withCompletionBlock:(void ( ^ ) ( NSError *error , WAuthData *authData ))block;
    
    
    // make sure we have a Wilddog url
    if ([self wilddogIsSetup]) {
        self.ref = [[Wilddog alloc] initWithUrl:kWilddogURL];
    }
    
/*
     向微信注册
     [WXApi registerApp:@"wx1234567890"];
*/

/*
     向微博注册
     [WeiboSDK registerApp:@"1234567890"];
     [WeiboSDK enableDebugMode:YES];
*/
    
    return YES;
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


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
//    if ([url.absoluteString hasPrefix:@"wx"]) {
//        return [WXApi handleOpenURL:url delegate:self];
//    }else if ([url.absoluteString hasPrefix:@"wb"]) {
//        return [WeiboSDK handleOpenURL:url delegate:self ];
//    }else if ([url.absoluteString hasPrefix:@"tencent"]) {
//        return [TencentOAuth HandleOpenURL:url];
//    }
    return NO;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
//    if ([url.absoluteString hasPrefix:@"wx"]) {
//        return [WXApi handleOpenURL:url delegate:self];
//    }else if ([url.absoluteString hasPrefix:@"wb"]) {
//        return [WeiboSDK handleOpenURL:url delegate:self ];
//    }else if ([url.absoluteString hasPrefix:@"tencent"]) {
//        return [TencentOAuth HandleOpenURL:url];
//    }
    return NO;
}


#pragma mark - WeiChatSDKDelegate
/*
-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendAuthResp class]])
    {
        SendAuthResp *response = (SendAuthResp*)resp;
        if(response.code.length == 0){
            return;
        }

        [self.ref authWithOAuthProvider:@"weixin" parameters:@{@"code":response.code} withCompletionBlock:^(NSError *error, WAuthData *authData) {
            
        }];
    }
}
*/

#pragma mark - WeiboSDKDelegate
/*
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        WBAuthorizeResponse *wbResponse = (WBAuthorizeResponse *)response;
        if (wbResponse.accessToken == nil || wbResponse.userID == nil) {
            return;
        }
 
        [self.ref authWithOAuthProvider:@"weibo" parameters:@{@"access_token":wbResponse.accessToken,@"userID":wbResponse.userID} withCompletionBlock:^(NSError *error, WAuthData *authData) {
        
        }];
    }
}
*/



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

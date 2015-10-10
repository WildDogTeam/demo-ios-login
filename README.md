# demo-ios-login
demo-ios-login 是一个基于 Wilddog iOS SDK 开发登录 demo，其中实现的功能实例有QQ登录、微信登录、微博登录、匿名登录。

    Login 步骤
    第一步：打开www.wilddog.com ———— 登录 ———— 创建您的app
    第二步：管理应用 ———— 终端用户认证 ———— 社交账号登录 ———— 填写相关信息
    第三步：在xcode集成您需要的第三方登录SDK（QQ、weixin、weibo）
    第四步：在第三方登录成功的代理方法中，填写Wilddog的oAuth方法登录

### 本地运行

首先确认本机已经安装Xcode 运行环境，然后执行,模拟器或者真机：
```
git clone git@github.com:WildDogTeam/demo-ios-login.git
cd  demo-ios-login
```

### 注册 Wilddog

Wildchat 需要 Wilddog 来同步和存储数据。您可以在这里[注册](https://www.wilddog.com/my-account/signup)一个免费帐户。

### 更多示例

这里分类汇总了 WildDog平台上的示例程序和开源应用，　链接地址：[https://github.com/WildDogTeam/wilddog-demos](https://github.com/WildDogTeam/wilddog-demos)

### 支持
如果在使用过程中有任何问题，请提 [issue](https://github.com/WildDogTeam/demo-ios-login/issues) ，我会在 Github 上给予帮助。

### 相关文档

* [Wilddog 概览](https://z.wilddog.com/overview/guide)
* [iOS SDK快速入门](https://z.wilddog.com/ios/quickstart)
* [iOS SDK 开发向导](https://z.wilddog.com/ios/guide/1)
* [iOS SDK API](https://z.wilddog.com/ios/api)
* [下载页面](https://www.wilddog.com/download/)
* [Wilddog FAQ](https://z.wilddog.com/faq/qa)
* [新浪微博开放平台](http://open.weibo.com/)
* [QQ 互联](http://connect.qq.com/)
* [微信开放平台](https://open.weixin.qq.com/)

### License
MIT
http://wilddog.mit-license.org/

### 感谢 Thanks

demo-ios-login is built on and with the aid of several  projects. We would like to thank the following projects for helping us achieve our goals:

Open Source:

* [loginDemo](https://github.com/firebase/login-demo-ios) Login powered by Firebase

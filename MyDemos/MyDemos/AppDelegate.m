//
//  AppDelegate.m
//  MyDemos
//
//  Created by 平安科技 on 17/4/20.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "W_URLProtocol.h"
#import <UserNotifications/UserNotifications.h>


@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = vc;
    
    //1.NSURLProtocoldemo需要在APPdelegate中注册自定义protocol类
    [NSURLProtocol registerClass:[W_URLProtocol class]];

    //远程推送功测试
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];        //点击通知开启引用后清除图标角标数字
    if ([[UIDevice currentDevice].systemVersion floatValue] >=10.0) {           //10.0以上系统推送实现
        
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge|UNAuthorizationOptionSound|UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                NSLog(@"iOS 10 request notification success");
            }else{
                NSLog(@"iOS 10 request notification fail");
            }
        }];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
    }else if([[UIDevice currentDevice].systemVersion floatValue] >= 8.0){       //8.0以上系统实现
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
    }else{                                                                      //7.0系统
        UIRemoteNotificationType type = UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:type];
    }

    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//支付宝
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
        }];
    }
    
    //在集成支付宝时都没用到（20170426-WJJ）
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回authCode
        
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
        }];
    }
    return YES;
}


#pragma mark - 8.0远程推送代理
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken{
    
    NSString *deviceTokenStr = [deviceToken description];
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@">" withString:@""];
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@"<" withString:@""];
    NSLog(@"deviceTokenStr = %@",deviceTokenStr);
    [[NSUserDefaults standardUserDefaults] setObject:deviceTokenStr forKey:@"deviceToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
    
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo{
    NSLog(@"userInfo = %@",userInfo);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"error = %@",error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    NSLog(@"error = %@",userInfo);
}

#pragma mark - 10.0远程推送代理方法
//APP在前台的时候收到推送的回调
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    
    //收到消息badge+1
    
    
    UNNotificationContent *content = notification.request.content;
    NSDictionary *userInfo = content.userInfo;
    
//    NSInteger badgeCatch = [[[NSUserDefaults standardUserDefaults] objectForKey:@"badge"] integerValue] + [[userInfo objectForKey:@"badge"] integerValue];
//    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%ld",badgeCatch] forKey:@"badge"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badgeCatch];        //点击通知开启引用后清除图标角标数字
    
    [self handleRemoteNotificationContent:userInfo];
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
    
 
    
}

//APP在后台，点击推送信息进入APP后执行的回调
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    
    UNNotificationContent *cotent = response.notification.request.content;
    NSDictionary *userInfo = cotent.userInfo;
    
    
    //点击通知开启引用后清除图标角标数字
    NSInteger badgeX = [UIApplication sharedApplication].applicationIconBadgeNumber;
    if ([UIApplication sharedApplication].applicationIconBadgeNumber > 0) {
        [userInfo setValue:[NSString stringWithFormat:@"%ld",badgeX-1] forKey:@"badge"];
    }else{
        [userInfo setValue:[NSString stringWithFormat:@"0"] forKey:@"badge"];
    }
    
    [self handleRemoteNotificationContent:userInfo];
    completionHandler();
}

- (void)handleRemoteNotificationContent:(NSDictionary *)userInfo{
    NSLog(@" iOS 10 after Notificatoin message:\n %@",userInfo);
}

@end

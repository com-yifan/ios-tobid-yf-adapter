//
//  AppDelegate.m
//  WindmillSample
//
//  Created by Codi on 2021/12/6.
//

#import "AppDelegate.h"
#import <WindMillSDK/WindMillSDK.h>
#import <AppTrackingTransparency/ATTrackingManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setNavigationBackItem];
    [self initLogService];
    [self initTableApparance];
    [self requestIDFA];
    //初始化SDK
    [WindMillAds setupSDKWithAppId:@"69693"];
    
    if (WindMillAds.hasInitSuccessed) {
        NSLog(@"初始化成功");
    }
    return YES;
}

- (void)requestIDFA {
    // 请在info.plist 文件中配置key：NSUserTrackingUsageDescription value:该ID将用于向您推送个性化广告
    // 项目需要适配http，如不支持http请咨询技术同学添加域名白名单
    /*
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    // 调试阶段尽量用真机, 以便获取idfa, 如果获取不到idfa, 则打开idfa开关
    // 打开idfa开关的过程:设置 -> 隐私 -> 跟踪 -> 允许App请求跟踪
    // 添加系统库 AdSupport.framework #import <AppTrackingTransparency/ATTrackingManager.h>
    // SDK初始化成功后可通过过滤YFAds:idfa查看设备IDFA
    if (@available(iOS 14, *)) {
        //iOS 14
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            
        }];
    } else {
        // Fallback on earlier versions
    }
}

- (void)initLogService {
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelVerbose]; // TTY = Xcode console // ASL = Apple System Logs
}

- (void)initTableApparance {
    [[UITableView appearance] setTableFooterView:[UIView new]];
    [[UITableView appearance] setSeparatorInset:UIEdgeInsetsZero];
}

- (void)setNavigationBackItem {
    [[UINavigationBar appearance] setTranslucent:NO];
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *app = [[UINavigationBarAppearance alloc] init];
        [app configureWithOpaqueBackground];
        app.backgroundColor = [UIColor colorWithRed:242/255.0 green:105/255.0 blue:11/255.0 alpha:1];
        app.titleTextAttributes = @{
            NSForegroundColorAttributeName: UIColor.whiteColor
        };
        [[UINavigationBar appearance] setScrollEdgeAppearance:app];
        [[UINavigationBar appearance] setStandardAppearance:app];
    }else {
        //设置导航栏左右按钮的着色
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        //设置导航栏背景颜色
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:242/255.0 green:105/255.0 blue:11/255.0 alpha:1]];
        //左右item的颜色】
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        //title
        [[UINavigationBar appearance] setTitleTextAttributes:@{
            NSForegroundColorAttributeName: UIColor.whiteColor
        }];
    }
}
@end

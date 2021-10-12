//
//  HMAdTTSplashRegister.m
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/9.
//

#import "HMAdTTSplashRegister.h"
#import <BUAdSDK/BUAdSDK.h>
#import <GDTMobSDK/GDTSDKConfig.h>
#import <LRAD/LRAD.h>
#import <AnyThinkSDK/AnyThinkSDK.h>

@implementation HMAdTTSplashRegister

+ (void)registAds {
    [BUAdSDKManager setAppID:@"5052053"];
    [GDTSDKConfig registerAppId:@"1110508937"];
    [[LRAdManager sharedManager] setupAppKey:@"56fd2f58bdd2e709227c27f5d2fdeea5" appSecret:@"10000129"];
    [[LRAdManager sharedManager] setupAdverts];
    NSError *error;
    [[ATAPI sharedInstance] startWithAppID:@"a612c73d0d06b3" appKey:@"f9ce6d580010d87f27c9f2883a3478fc" error:&error];
}

+ (void)showDebugLogIsEnabled:(BOOL)enabled {
    [BUAdSDKManager setLoglevel: enabled ? BUAdSDKLogLevelDebug : BUAdSDKLogLevelInfo];
    [[LRAdManager sharedManager] showDebugLog:enabled];
    [ATAPI setLogEnabled:enabled];
}

//// 获取广告sdk版本号
//class func version(with platform: AdPlatform, nativePlatform: AdNativePlatform = .none) -> String? {
//    var version: String?
//
//    switch platform {
//    case .native:
//        switch nativePlatform {
//        case .tt:
//            version = BUAdSDKManager.sdkVersion
//        case .gdt:
//            version = GDTSDKConfig.sdkVersion()
//        case .none:
//            assertionFailure("设置原生广告平台必须要指定是哪个原生广告平台")
//        }
//    case .lanren:
//        version = "1.1.15"
//    case .topon:
//        version = ATAPI.sharedInstance().version()
//    }
//
//    return version
//}
@end

//
//  HMAdTTSplashRegister.h
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMAdTTSplashRegister : NSObject

/// 注册所有的广告对象
+ (void)registAds;

/// 是否控制台打印日志
/// @param enabled 是否开启日志
+ (void)showDebugLogIsEnabled:(BOOL)enabled;
@end

NS_ASSUME_NONNULL_END

//
//  HMAdSplashManager.h
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/8.
//

#import "HMAdSplashAdapter.h"
#import "HMAdSplashDelegate.h"
#import "HMAdTTSplashAdapter.h"
NS_ASSUME_NONNULL_BEGIN

@interface HMAdSplashManager : NSObject

/// 单例
+ (instancetype)sharedInstance;

/// 设置广告对象
/// @param object 对象
/// @param window 承载视图
/// @param delegate 代理
- (void)setupWithAdObject:(id <HMAdSplashAdapter>)object window:(UIWindow *)window delegate:(id <HMAdSplashDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END

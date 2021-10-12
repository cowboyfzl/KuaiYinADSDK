//
//  HMADSplashInternalProtocol.h
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/8.
//

#import <Foundation/Foundation.h>
#import "HMAdSplashDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@protocol HMADSplashInternalProtocol <NSObject>

/// 代理
@property (nonatomic, weak) id<HMAdSplashDelegate> delegate;

/// 代理
@property (nonatomic, weak) UIWindow *window;

/// 展示广告
/// @param window 承载视图
/// @param delegate 代理
- (void)showWithWindow:(UIWindow *)window delegate:(id <HMAdSplashDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END

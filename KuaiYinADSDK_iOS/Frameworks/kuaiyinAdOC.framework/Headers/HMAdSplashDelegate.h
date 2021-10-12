//
//  HMAdSplashDelegate.h
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/8.
//

#import <Foundation/Foundation.h>
#import "HMAdSplashModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol HMAdSplashDelegate <NSObject>

/// 广告位错误
/// @param adModel 开屏广告模型
/// @param error 错误对象
- (void)adIdErrorWithAdModel:(HMAdSplashModel *)adModel error:(NSError * __nullable)error;

/// 成功加载广告资源
/// @param adModel 开屏广告模型
- (void)didFinishLoadingWithAdModel:(HMAdSplashModel *)adModel;

/// 无法加载广告资源
/// @param adModel 开屏广告模型
/// @param error 错误对象
- (void)didFailToLoadingWithAdModel:(HMAdSplashModel *)adModel error:(NSError * __nullable)error;

/// 开屏广告已经展示
/// @param adModel 开屏广告模型
- (void)splashDidShowWithAdModel:(HMAdSplashModel *)adModel;

/// 开屏广告加载失败
/// @param adModel 广告模型
/// @param error 错误对象
- (void)splashDidShowFailedWithAdModel:(HMAdSplashModel *)adModel error:(NSError * __nullable)error;

/// 开屏广告关闭
/// @param adModel 广告模型
- (void)splashDidCloseWithAdModel:(HMAdSplashModel *)adModel;

/// 开屏广告详情关闭
/// @param adModel 广告模型
- (void)splashDetailDidCloseWithAdModel:(HMAdSplashModel *)adModel;

/// 开屏广告倒计时结束
/// @param adModel 广告模型
- (void)splashCountdownToZeroWithAdModel:(HMAdSplashModel *)adModel;

/// 开屏广告点击
/// @param adModel 广告模型
- (void)splashDidClickWithAdModel:(HMAdSplashModel *)adModel;

/// 开屏广告点击跳过
/// @param adModel 广告模型
- (void)splashDidClickSkipWithAdModel:(HMAdSplashModel *)adModel;

@end

NS_ASSUME_NONNULL_END

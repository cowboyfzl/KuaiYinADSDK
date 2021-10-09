//
//  HMAdSplashModel.h
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/8.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
/// 需要传入有 placementId、platform
/// 如果有slotId就传入，没有就忽略
/// platform传入平台类型 比如 ocean_engine、gdt、lanren、topon
@interface HMAdSplashModel : NSObject
/// 广告平台字符串
@property (nonatomic, copy, nullable) NSString *platform;
/// 广告平台最终类型（聚合平台真正调用的广告位，比如百度、头条、广点通等等）
@property (nonatomic, copy, nullable) NSString *platformString;
/// 广告位Id
@property (nonatomic, copy) NSString *placementId;
/// 广告位Id
@property (nonatomic, copy, nullable) NSString *slotId;
/// 广告源
@property (nonatomic, copy, nullable) NSString *adSource;
/// 最大超时时间
@property (nonatomic, assign) NSTimeInterval timeout;
/// 广告位Id
@property (nonatomic, assign) BOOL isAdValid;

@end

NS_ASSUME_NONNULL_END

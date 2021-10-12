//
//  HMAdSplashAdapter.h
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/8.
//

#import <UIKit/UIKit.h>
#import "HMAdSplashDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@protocol HMAdSplashAdapter <NSObject>

/// 数据模型
@property (nonatomic, strong) HMAdSplashModel *splashModel;

/// 版本号
+ (NSString * __nullable)adVersion;

@end

NS_ASSUME_NONNULL_END

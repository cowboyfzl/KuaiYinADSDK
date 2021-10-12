//
//  HMAdTTSplashAdapter.m
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/8.
//

#import "HMAdTTSplashAdapter.h"
#import "HMADSplashInternalProtocol.h"
#import <BUAdSDK/BUAdSDK.h>
@interface HMAdTTSplashAdapter () <HMADSplashInternalProtocol, BUSplashAdDelegate>
/// 广告类
@property (nonatomic, strong, nullable) BUSplashAdView *adView;

@end

@implementation HMAdTTSplashAdapter
@synthesize splashModel = _splashModel;
@synthesize delegate = _delegate;
@synthesize window = _window;

- (void)showWithWindow:(nonnull UIWindow *)window delegate:(nonnull id<HMAdSplashDelegate>)delegate {
    if (_adView != nil) {
        return;
    }
    
    self.delegate = delegate;
    self.window = window;
    
    self.adView = [[BUSplashAdView alloc]initWithSlotID:self.splashModel.placementId frame:[UIScreen mainScreen].bounds];
    _adView.delegate = self;
    [_adView loadAdData];
}

#pragma mark - BUSplashAdDelegate
- (void)splashAdDidLoad:(BUSplashAdView *)splashAd {
    HMAdSplashModel *adSplashModel = [self convertWithAdView:splashAd];
    if ([self.delegate respondsToSelector:@selector(didFinishLoadingWithAdModel:)]) {
        [self.delegate didFinishLoadingWithAdModel: adSplashModel];
    }
    
    if (_window != nil && _window.rootViewController != nil && _adView != nil) {
        [_window addSubview:_adView];
        _adView.rootViewController = _window.rootViewController;
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(splashDidShowFailedWithAdModel:error:)]) {
        [self.delegate splashDidShowFailedWithAdModel:adSplashModel error:nil];
    }
}

- (void)splashAd:(BUSplashAdView *)splashAd didFailWithError:(NSError * _Nullable)error {
    if ([self.delegate respondsToSelector:@selector(didFailToLoadingWithAdModel:error:)]) {
        [self.delegate didFailToLoadingWithAdModel: [self convertWithAdView:splashAd] error:error];
    }
    
    [_adView removeFromSuperview];
    _adView = nil;
}

- (void)splashAdWillVisible:(BUSplashAdView *)splashAd {
    if ([self.delegate respondsToSelector:@selector(splashDidShowWithAdModel:)]) {
        [self.delegate splashDidShowWithAdModel: [self convertWithAdView:splashAd]];
    }
}

- (void)splashAdDidClick:(BUSplashAdView *)splashAd {
    if ([self.delegate respondsToSelector:@selector(splashDidClickWithAdModel:)]) {
        [self.delegate splashDidClickWithAdModel: [self convertWithAdView:splashAd]];
    }
}

- (void)splashAdDidClose:(BUSplashAdView *)splashAd {
    if ([self.delegate respondsToSelector:@selector(splashDetailDidCloseWithAdModel:)]) {
        [self.delegate splashDetailDidCloseWithAdModel: [self convertWithAdView:splashAd]];
    }
    
    [_adView removeFromSuperview];
    _adView = nil;
}

- (void)splashAdDidClickSkip:(BUSplashAdView *)splashAd {
    if ([self.delegate respondsToSelector:@selector(splashDidClickSkipWithAdModel:)]) {
        [self.delegate splashDidClickSkipWithAdModel: [self convertWithAdView:splashAd]];
    }
    
    [_adView removeFromSuperview];
    _adView = nil;
}

- (void)splashAdCountdownToZero:(BUSplashAdView *)splashAd {
    if ([self.delegate respondsToSelector:@selector(splashCountdownToZeroWithAdModel:)]) {
        [self.delegate splashCountdownToZeroWithAdModel: [self convertWithAdView:splashAd]];
    }
    
    [_adView removeFromSuperview];
    _adView = nil;
}

- (void)splashAdWillClose:(BUSplashAdView *)splashAd {
    
}

- (void)splashAdDidCloseOtherController:(BUSplashAdView *)splashAd interactionType:(BUInteractionType)interactionType {
    
}

- (HMAdSplashModel *)convertWithAdView:(BUSplashAdView *)splashAd {
    HMAdSplashModel *model = [[HMAdSplashModel alloc]init];
    model.slotId = _splashModel.slotId;
    model.timeout = splashAd.tolerateTimeout;
    model.isAdValid = splashAd.isAdValid;
    model.placementId = _splashModel.placementId;
    model.platformString = _splashModel.platformString;
    return model;
}

+ (NSString *)adVersion {
    return BUAdSDKManager.SDKVersion;
}

- (HMAdSplashModel *)splashModel {
    if (!_splashModel) {
        _splashModel = [[HMAdSplashModel alloc]init];
    }
    
    return _splashModel;
}
@end

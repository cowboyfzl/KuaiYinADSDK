//
//  HMAdSplashManager.m
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/8.
//

#import "HMAdSplashManager.h"
#import <LRAD/LRAD.h>
#import "HMADSplashInternalProtocol.h"
@interface HMAdSplashManager () <HMAdSplashDelegate>
@property (nonatomic, strong) id <HMAdSplashAdapter> adSplash;
@property (nonatomic, weak) id <HMAdSplashDelegate> delegate;
@end

@implementation HMAdSplashManager

+ (instancetype)sharedInstance {
   static HMAdSplashManager *manager;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
       manager = [[HMAdSplashManager alloc] init];
   });
    
   return manager;
}

- (void)setupWithAdObject:(id <HMAdSplashAdapter>)object window:(UIWindow *)window delegate:(id <HMAdSplashDelegate>)delegate {
    if (_adSplash != nil) {
        return;
    }
    
    self.adSplash = object;
    self.delegate = delegate;
    if ([_adSplash conformsToProtocol:@protocol(HMADSplashInternalProtocol)]) {
        id <HMADSplashInternalProtocol> adSplash = (id <HMADSplashInternalProtocol>) _adSplash;
        [adSplash showWithWindow:window delegate:self];
    }
}

#pragma mark - HMAdSplashDelegate
- (void)adIdErrorWithAdModel:(nonnull HMAdSplashModel *)adModel error:(NSError * _Nullable)error {
    _adSplash = nil;
    if ([self.delegate respondsToSelector:@selector(adIdErrorWithAdModel:error:)]) {
        [self.delegate adIdErrorWithAdModel:adModel error:error];
    }
}

- (void)didFailToLoadingWithAdModel:(nonnull HMAdSplashModel *)adModel error:(NSError * _Nullable)error {
    _adSplash = nil;
    if ([self.delegate respondsToSelector:@selector(didFailToLoadingWithAdModel:error:)]) {
        [self.delegate didFailToLoadingWithAdModel:adModel error:error];
    }
}

- (void)didFinishLoadingWithAdModel:(nonnull HMAdSplashModel *)adModel {
    if ([self.delegate respondsToSelector:@selector(didFinishLoadingWithAdModel:)]) {
        [self.delegate didFinishLoadingWithAdModel:adModel];
    }
}

- (void)splashCountdownToZeroWithAdModel:(nonnull HMAdSplashModel *)adModel {
    if ([self.delegate respondsToSelector:@selector(splashCountdownToZeroWithAdModel:)]) {
        [self.delegate splashCountdownToZeroWithAdModel:adModel];
    }
}

- (void)splashDetailDidCloseWithAdModel:(nonnull HMAdSplashModel *)adModel {
    _adSplash = nil;
    if ([self.delegate respondsToSelector:@selector(splashDetailDidCloseWithAdModel:)]) {
        [self.delegate splashDetailDidCloseWithAdModel:adModel];
    }
}

- (void)splashDidClickSkipWithAdModel:(nonnull HMAdSplashModel *)adModel {
    if ([self.delegate respondsToSelector:@selector(splashDidClickSkipWithAdModel:)]) {
        [self.delegate splashDidClickSkipWithAdModel:adModel];
    }
}

- (void)splashDidClickWithAdModel:(nonnull HMAdSplashModel *)adModel {
    if ([self.delegate respondsToSelector:@selector(splashDidClickWithAdModel:)]) {
        [self.delegate splashDidClickWithAdModel:adModel];
    }
}

- (void)splashDidCloseWithAdModel:(nonnull HMAdSplashModel *)adModel {
    if ([self.delegate respondsToSelector:@selector(splashDidCloseWithAdModel:)]) {
        [self.delegate splashDidCloseWithAdModel:adModel];
    }
}

- (void)splashDidShowFailedWithAdModel:(nonnull HMAdSplashModel *)adModel error:(NSError * _Nullable)error {
    if ([self.delegate respondsToSelector:@selector(splashDidShowFailedWithAdModel:error:)]) {
        [self.delegate splashDidShowFailedWithAdModel:adModel error:error];
    }
}

- (void)splashDidShowWithAdModel:(nonnull HMAdSplashModel *)adModel {
    if ([self.delegate respondsToSelector:@selector(splashDidShowWithAdModel:)]) {
        [self.delegate splashDidShowWithAdModel:adModel];
    }
}

@end

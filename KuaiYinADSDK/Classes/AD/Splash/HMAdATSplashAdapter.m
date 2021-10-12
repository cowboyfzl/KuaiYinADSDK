//
//  HMAdATSplashAdapter.m
//  KuaiYinADProject
//
//  Created by 法正磊 on 2021/10/11.
//

#import "HMAdATSplashAdapter.h"
#import "HMADSplashInternalProtocol.h"
#import <AnyThinkSplash/AnyThinkSplash.h>
@interface HMAdATSplashAdapter () <HMADSplashInternalProtocol, ATSplashDelegate>

@end

@implementation HMAdATSplashAdapter
@synthesize splashModel = _splashModel;
@synthesize delegate = _delegate;
@synthesize window = _window;

- (void)showWithWindow:(UIWindow *)window delegate:(id<HMAdSplashDelegate>)delegate {
    self.delegate = delegate;
    self.window = window;
    [[ATAdManager sharedManager]loadADWithPlacementID:self.splashModel.placementId extra:nil delegate:self];
}

+ (NSString *)adVersion {
    return [[ATAPI sharedInstance]version];
}

- (void)didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    if ([self.delegate respondsToSelector:@selector(didFailToLoadingWithAdModel:error:)]) {
        [self.delegate didFailToLoadingWithAdModel:[self convertWithExtra:nil] error:error];
    }
}

- (void)didFinishLoadingADWithPlacementID:(NSString *)placementID {
    if ([self.delegate respondsToSelector:@selector(didFinishLoadingWithAdModel:)]) {
        [self.delegate didFinishLoadingWithAdModel:[self convertWithExtra:nil]];
    }
    
    /// 如果命中快手sdk，window的rootViewController为nil，会crash
    if (self.window) {
        [[ATAdManager sharedManager]showSplashWithPlacementID:self.splashModel.placementId window:self.window delegate:self];
    } else {
        if ([self.delegate respondsToSelector:@selector(didFailToLoadingWithAdModel:error:)]) {
            [self.delegate didFailToLoadingWithAdModel:[self convertWithExtra:nil] error:nil];
        }
    }
}

- (void)didFinishLoadingSplashADWithPlacementID:(NSString *)placementID isTimeout:(BOOL)isTimeout {
    if (!isTimeout) {
        if ([self.delegate respondsToSelector:@selector(didFinishLoadingWithAdModel:)]) {
            [self.delegate didFinishLoadingWithAdModel:[self convertWithExtra:nil]];
        }
        
        /// 如果命中快手sdk，window的rootViewController为nil，会crash
        if (self.window) {
            [[ATAdManager sharedManager]showSplashWithPlacementID:self.splashModel.placementId window:self.window delegate:self];
        } else {
            if ([self.delegate respondsToSelector:@selector(didFailToLoadingWithAdModel:error:)]) {
                [self.delegate didFailToLoadingWithAdModel:[self convertWithExtra:nil] error:nil];
            }
        }
        
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(didFailToLoadingWithAdModel:error:)]) {
        [self.delegate didFailToLoadingWithAdModel:[self convertWithExtra:nil] error:nil];
    }
}

- (void)didTimeoutLoadingSplashADWithPlacementID:(NSString *)placementID {
    
}

- (void)splashCountdownTime:(NSInteger)countdown forPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    if (countdown == 0) {
        if ([self.delegate respondsToSelector:@selector(splashCountdownToZeroWithAdModel:)]) {
            [self.delegate splashCountdownToZeroWithAdModel:[self convertWithExtra:extra]];
        }
    }
}

- (void)splashDeepLinkOrJumpForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra result:(BOOL)success {
    
}

- (void)splashDetailDidClosedForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    if ([self.delegate respondsToSelector:@selector(splashDetailDidCloseWithAdModel:)]) {
        [self.delegate splashDetailDidCloseWithAdModel:[self convertWithExtra:extra]];
    }
}

- (void)splashDidClickForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    if ([self.delegate respondsToSelector:@selector(splashDidClickWithAdModel:)]) {
        [self.delegate splashDidClickWithAdModel:[self convertWithExtra:extra]];
    }
}

- (void)splashDidCloseForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    if ([self.delegate respondsToSelector:@selector(splashDidCloseWithAdModel:)]) {
        [self.delegate splashDidCloseWithAdModel:[self convertWithExtra:extra]];
    }
}

- (void)splashDidShowFailedForPlacementID:(NSString *)placementID error:(NSError *)error extra:(NSDictionary *)extra {
    if ([self.delegate respondsToSelector:@selector(splashDidShowFailedWithAdModel:error:)]) {
        [self.delegate splashDidShowFailedWithAdModel:[self convertWithExtra:extra] error:error];
    }
}

- (void)splashDidShowForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    if ([self.delegate respondsToSelector:@selector(splashDidShowWithAdModel:)]) {
        [self.delegate splashDidShowWithAdModel:[self convertWithExtra:extra]];
    }
}

- (void)splashZoomOutViewDidClickForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    
}

- (void)splashZoomOutViewDidCloseForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    if ([self.delegate respondsToSelector:@selector(splashDetailDidCloseWithAdModel:)]) {
        [self.delegate splashDetailDidCloseWithAdModel:[self convertWithExtra:extra]];
    }
}

- (HMAdSplashModel *)convertWithExtra:(NSDictionary *)extra {
    HMAdSplashModel *model = [[HMAdSplashModel alloc]init];
    model.slotId = _splashModel.slotId;
    model.placementId = _splashModel.placementId;
    model.platformString = _splashModel.platformString;
    model.extra = extra;
    return model;
}

@end

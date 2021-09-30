//
//  HMAdSplashManager.swift
//  KuaiYin
//
//  Created by 韩冬 on 2021/9/1.
//  Copyright © 2021 Chengdu Happy Music Technology Co., Ltd. All rights reserved.
//

import UIKit

public class HMAdSplashManager {
    
    private var platform: AdPlatform
    private var nativePlatform: AdNativePlatform
    private var adSplash: HMAdSplashAdapter?
    private weak var delegate: HMAdSplashDelegate?
    
    private init() {
        platform = .native
        nativePlatform = .tt
    }
    
    static let shared = HMAdSplashManager()
    
    // 设置广告平台
    func setAdPlatform(platform: AdPlatform, nativePlatform: AdNativePlatform = .none) {
        self.platform = platform
        self.nativePlatform = nativePlatform
    }
    
//    func cacheAdResource(with placementId: String, window: UIWindow, delegate: HMAdSplashDelegate?) {
//        switch platform {
//        case .native:
//            switch nativePlatform {
//            case .tt:
//                HMAdTTSplashAdapter.cacheAdResource(with: placementId, window: window, delegate: delegate)
//            case .gdt:
//                HMAdGDTSplashAdapter.cacheAdResource(with: placementId, window: window, delegate: delegate)
//            }
//        case .lanren:
//            HMAdLRSplashAdapter.cacheAdResource(with: placementId, window: window, delegate: delegate)
//        case .topon:
//            HMAdATSplashAdapter.cacheAdResource(with: placementId, window: window, delegate: delegate)
//        }
//    }
    
    // 展示广告
    func show(with placementId: String, window: UIWindow, delegate: HMAdSplashDelegate?) {
        // 频繁调用show可能走到下面的判断
        if adSplash != nil {
            return
        }
        
        self.delegate = delegate
        
        switch platform {
        case .native:
            switch nativePlatform {
            case .tt:
                adSplash = HMAdTTSplashAdapter()
            case .gdt:
                adSplash = HMAdGDTSplashAdapter()
            case .none:
                assertionFailure("设置原生广告平台必须要指定是哪个原生广告平台")
            }
        case .lanren:
            adSplash = HMAdLRSplashAdapter()
        case .topon:
            adSplash = HMAdATSplashAdapter()
        }
        
        guard let adSplash = adSplash else {
            delegate?.splashDidShowFailed(for: nil, error: nil)
            return
        }
        
        // 展示广告
        adSplash.show(with: placementId, window: window, delegate: self)
    }
}

extension HMAdSplashManager: HMAdSplashDelegate {
    // 广告位错误
    func adIdError(with adModel: HMAdSplashModel, error: Error?) {
        delegate?.adIdError(with: adModel, error: error)
        adSplash = nil
    }
    
    // 成功加载广告资源
    func didFinishLoadingAd(with adModel: HMAdSplashModel) {
        delegate?.didFinishLoadingAd(with: adModel)
    }
    
    // 无法加载广告资源
    func didFailToLoadingAd(with adModel: HMAdSplashModel, error: Error?) {
        delegate?.didFailToLoadingAd(with: adModel, error: error)
        adSplash = nil
    }
    
    // 展示开屏广告
    func splashDidShow(for adModel: HMAdSplashModel) {
        delegate?.splashDidShow(for: adModel)
    }

    // 展示开屏广告失败
    func splashDidShowFailed(for adModel: HMAdSplashModel?, error: Error?) {
        delegate?.splashDidShowFailed(for: adModel, error: error)
    }
    
    // 开屏广告关闭
    func splashDidClose(for adModel: HMAdSplashModel) {
        delegate?.splashDidClose(for: adModel)
        adSplash = nil
    }
    
    // 点击的广告展示关闭
    func splashDetailDidClose(for adModel: HMAdSplashModel) {
        delegate?.splashDetailDidClose(for: adModel)
    }
    
    // 跳过倒计时结束
    func splashCountdownToZero(for adModel: HMAdSplashModel) {
        delegate?.splashCountdownToZero(for: adModel)
    }
    
    // 点击广告
    func splashDidClick(for adModel: HMAdSplashModel) {
        delegate?.splashDidClick(for: adModel)
    }
    
    // 点击跳过
    func splashDidClickSkip(for adModel: HMAdSplashModel) {
        delegate?.splashDidClose(for: adModel)
    }
}

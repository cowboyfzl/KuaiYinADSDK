//
//  HMAdRewardedManager.swift
//  KuaiYin
//
//  Created by 法正磊 on 2021/9/8.
//  Copyright © 2021 Chengdu Happy Music Technology Co., Ltd. All rights reserved.
//

import UIKit

public class HMAdRewardedManager: NSObject {
    
    //MARK: 私有方法
    /// 平台
    private(set) var platform: AdPlatform
    /// 本地平台
    private(set) var nativePlatform: AdNativePlatform
    /// 当前的广告对象
    private var rewarded: HMAdRewdedAdapter?
    /// 代理
    private weak var delegate: HMAdRewardedDelegate?
    
    private override init() {
        platform = .native
        nativePlatform = .tt
    }
    
    static let shared = HMAdRewardedManager()
    
    // 设置广告平台
    public func setAdPlatform(platform: AdPlatform, nativePlatform: AdNativePlatform = .tt) {
        self.platform = platform
        self.nativePlatform = nativePlatform
    }
    
    // 展示广告
    public func show(with placementId: String, viewController: UIViewController, delegate: HMAdRewardedDelegate?) {
        self.delegate = delegate
        switch platform {
        case .native:
            switch nativePlatform {
            case .tt:
                rewarded = HMAdTTRewardedAdapter()
            case .gdt:
                rewarded = HMAdGDTRewardedAdapter()
            case .none:
                return
            }
        case .lanren:
            rewarded = HMAdLRRewardedVideoAdapter()
        case .topon:
            rewarded = HMAdATRewardedVideoAdapter()
        }
        
        // 展示广告
        rewarded?.show(with: placementId, viewController: viewController, delegate: self)
    }
}

extension HMAdRewardedManager: HMAdRewardedDelegate {
    public func adIdError(with adModel: HMAdRewardedModel, error: Error?) {
        delegate?.adIdError(with: adModel, error: error)
    }
    
    public func didFinishLoadingAd(with adModel: HMAdRewardedModel) {
        delegate?.didFinishLoadingAd(with: adModel)
    }
    
    public func didFailToLoadingAd(with adModel: HMAdRewardedModel, error: Error?) {
        delegate?.didFailToLoadingAd(with: adModel, error: error)
    }
    
    public func adDidShow(for adModel: HMAdRewardedModel) {
        delegate?.adDidShow(for: adModel)
    }
    
    public func adDidClose(for adModel: HMAdRewardedModel) {
        rewarded = nil
        delegate?.adDidClose(for: adModel)
    }
    
    public func adCountdownToZero(for adModel: HMAdRewardedModel) {
        delegate?.adCountdownToZero(for: adModel)
    }
    
    public func adDidClick(for adModel: HMAdRewardedModel) {
        delegate?.adDidClick(for: adModel)
    }
    
    public func adDidClickSkip(for adModel: HMAdRewardedModel) {
        delegate?.adDidClickSkip(for: adModel)
    }
    
    public func adPlayError(for adModel: HMAdRewardedModel, error: Error?) {
        delegate?.adPlayError(for: adModel, error: error)
    }
    
    public func adDidRewardSuccess(for adModel: HMAdRewardedModel) {
        delegate?.adDidRewardSuccess(for: adModel)
    }
    
    public func adExposed(for adModel: HMAdRewardedModel) {
        delegate?.adExposed(for: adModel)
    }
}

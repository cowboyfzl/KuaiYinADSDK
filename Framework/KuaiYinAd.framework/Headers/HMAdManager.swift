//
//  HMAdManager.swift
//  KuaiYin
//
//  Created by 韩冬 on 2021/9/1.
//  Copyright © 2021 Chengdu Happy Music Technology Co., Ltd. All rights reserved.
//

import Foundation
import BUAdSDK
import LRAD
import AnyThinkSDK
import PackageBridge
public enum AdPlatform: String {
    case native
    case lanren
    case topon
}

public enum AdNativePlatform: String {
    case none
    case tt = "ocean_engine"
    case gdt
}

public func convertStringToPlatform(_ string: String?) -> (AdPlatform?, AdNativePlatform?) {
    switch string {
    case "ocean_engine":
        return (.native, .tt)
    case "gdt":
        return (.native, .gdt)
    case "lanren":
        return (.lanren, nil)
    case "topon":
        return (.topon, nil)
    default:
        return (nil, nil)
    }
}

func DeBugPrint(_ string: String) {
    
}

// 广告管理
public class HMAdManager {
    
    // 初始化sdk
    class func setup(platform: AdPlatform, nativePlatform: AdNativePlatform = .none, appId: String, appKey: String = "") {
        switch platform {
        case .native:
            switch nativePlatform {
            case .tt:
                BUAdSDKManager.setAppID(appId)
            case .gdt:
                GDTSDKConfig.registerAppId(appId)
            case .none:
                assertionFailure("设置原生广告平台必须要指定是哪个原生广告平台")
            }
        case .lanren:
            LRAdManager.shared().setupAppKey(appId, appSecret: appKey)
            LRAdManager.shared().setupAdverts()
        case .topon:
            try? ATAPI.sharedInstance().start(withAppID: appId, appKey: appKey)
        }
    }
    
    // 设置日志
    class func showDebugLog(_ logEnabled: Bool) {
        BUAdSDKManager.setLoglevel(logEnabled ? .debug : .info)
        LRAdManager.shared().showDebugLog(logEnabled)
        ATAPI.setLogEnabled(logEnabled)
    }
    
    // 获取广告sdk版本号
    class func version(with platform: AdPlatform, nativePlatform: AdNativePlatform = .none) -> String? {
        var version: String?
        
        switch platform {
        case .native:
            switch nativePlatform {
            case .tt:
                version = BUAdSDKManager.sdkVersion
            case .gdt:
                version = GDTSDKConfig.sdkVersion()
            case .none:
                assertionFailure("设置原生广告平台必须要指定是哪个原生广告平台")
            }
        case .lanren:
            version = "1.1.15"
        case .topon:
            version = ATAPI.sharedInstance().version()
        }
        
        return version
    }
}

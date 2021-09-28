#
#  Be sure to run `pod spec lint KuaiYinADSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "KuaiYinADSDK"
  spec.version      = "1.0.1"
  spec.summary      = "快音广告SDK"

  spec.description  = <<-DESC
  这是一个广告聚合平台
                   DESC

  spec.homepage     = "https://github.com/cowboyfzl/KuaiYinADSDK"

  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { 'LeonFa' => '12456715@qq.com' }
  spec.source       = { :git => "https://github.com/cowboyfzl/KuaiYinADSDK.git", :tag => "#{spec.version}"}
  spec.platform      = :ios, "10.0" #支持平台
  spec.ios.deployment_target = "10.0"#支持iOS最低版本
  spec.frameworks    = 'UIKit','AVFoundation'
   # Swift Versions
  spec.swift_version = '5.0'
  spec.vendored_frameworks = "KuaiYinADSDK_iOS/Frameworks/*.{framework}"#SDK相对本文件路径
  spec.requires_arc = true
  spec.xcconfig = { 'LD_RUNPATH_SEARCH_PATHS' => '"$(PODS_ROOT)/KuaiYinADSDK_iOS/Frameworks"' }
  specpreserve_paths = "KuaiYinADSDK_iOS/Frameworks/*.{framework}"

  spec.dependency 'GDTMobSDK', '4.13.00'
  # 穿山甲
  spec.dependency 'Ads-CN', '3.8.1.0'
  
  # 懒人科技聚合广告SDK
  spec.dependency 'LRAdSDK', '1.1.15'

  # topon聚合广告SDK
  spec.dependency 'AnyThinkiOS', '5.7.65'
  spec.dependency 'AnyThinkiOS/AnyThinkGDTAdapter', '5.7.65'
  spec.dependency 'AnyThinkiOS/AnyThinkPangleAdapter', '5.7.65'
  spec.dependency 'AnyThinkiOS/AnyThinkBaiduAdapter', '5.7.65'
  spec.dependency 'AnyThinkiOS/AnyThinkKSAdapter', '5.7.65'
end

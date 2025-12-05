Pod::Spec.new do |s|
  s.name             = "WMYFAdAdapter"
  s.version          = "4.6.85"
  s.summary          = "WMYFAdAdapter for YFAdsSDK and ToBid-iOS"
  s.description      = <<-DESC
  WMYFAdAdapter 提供YF广告适配支持，依赖 YFAdsSDK 和 ToBid-iOS。
  DESC

  s.homepage         = "https://your-homepage.example"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Erik" => "your-email@example.com" }

  # 你的源码位置（通常放在 Git）
  s.source           = { :git => "https://github.com/com-yifan/ToBid-YF-Adapter.git", :tag => s.version }

  # ⚠️ Podspec 要求 xcframework 必须放在下面结构：
  # WMYFAdAdapter/
  # ├── WMYFAdAdapter.xcframework
  s.vendored_frameworks = "WMYFAdAdapter/WMYFAdAdapter.xcframework"

  # 平台
  s.platform     = :ios, "10.0"

  # 依赖项
  #s.dependency "YFAdsSDK"
  #s.dependency "ToBid-iOS"
  s.static_framework = true
end

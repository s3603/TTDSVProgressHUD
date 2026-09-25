Pod::Spec.new do |s|
  s.name     = 'SVProgressHUD'
  s.version  = '2.3.2'
  s.ios.deployment_target = '12.0'
  s.tvos.deployment_target = '12.0'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'A clean and lightweight progress HUD for your iOS and tvOS app.'
  s.homepage = 'https://github.com/SVProgressHUD/SVProgressHUD'
  s.authors   = { 'Sam Vermette' => 'hello@samvermette.com', 'Tobias Totzek' => 'tobias@totzek.me' }
  s.source   = { :git => 'https://github.com/SVProgressHUD/SVProgressHUD.git', :tag => s.version.to_s }

  s.description = 'SVProgressHUD is a clean and easy-to-use HUD meant to display the progress of an ongoing task on iOS and tvOS. The success and error icons are from Freepik from Flaticon and are licensed under Creative Commons BY 3.0.'

  s.framework    = 'QuartzCore'
  s.requires_arc = true

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'SVProgressHUD/*.{h,m}'
    # 2026-09-25: 原 resource_bundles {'SVProgressHUD' => PrivacyInfo} 会生成与 resources
    # 直接拷贝的 SVProgressHUD.bundle 同名产物，CocoaPods 报 Multiple commands produce，
    # 改为统一走 resources 直接拷贝（本地 fork 改造版，上游未合并前 :path/:git 均用此 spec）
    core.resources = ['SVProgressHUD/SVProgressHUD.bundle', 'SVProgressHUD/PrivacyInfo.xcprivacy']
  end

  s.subspec 'AppExtension' do |ext|
    ext.source_files = 'SVProgressHUD/*.{h,m}'
    ext.resources = ['SVProgressHUD/SVProgressHUD.bundle']
    ext.resource_bundles = {'AppExtension' => ['SVProgressHUD/PrivacyInfo.xcprivacy']}
    ext.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'SV_APP_EXTENSIONS=1' }
  end
end

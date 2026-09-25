Pod::Spec.new do |s|
  s.name     = 'TTDProgressHUD'
  s.version  = '2.3.3'
  s.ios.deployment_target = '12.0'
  s.tvos.deployment_target = '12.0'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'TTD-renamed variant of SVProgressHUD with multi-scene/foldable window fixes.'
  s.homepage = 'https://github.com/s3603/TTDSVProgressHUD'
  s.authors   = { 'Sam Vermette' => 'hello@samvermette.com', 'Tobias Totzek' => 'tobias@totzek.me' }
  s.source   = { :git => 'https://github.com/s3603/TTDSVProgressHUD.git', :branch => 'ttd' }

  s.description = 'TTDProgressHUD is a TTD-renamed variant of SVProgressHUD (MIT). Based on upstream master + PR #1159 (multi-scene window handling for foldable/multi-window devices) + fade-out race fix. Image bundle renamed accordingly.'

  s.framework    = 'QuartzCore'
  s.requires_arc = true

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'SVProgressHUD/*.{h,m}'
    # 2026-09-25: privacy manifest ships via plain resources copy (avoids same-name
    # resource_bundles collision, same fix as SVProgressHUD.podspec on pr-1159 branch)
    core.resources = ['SVProgressHUD/TTDProgressHUD.bundle', 'SVProgressHUD/PrivacyInfo.xcprivacy']
  end

  s.subspec 'AppExtension' do |ext|
    ext.source_files = 'SVProgressHUD/*.{h,m}'
    ext.resources = ['SVProgressHUD/TTDProgressHUD.bundle', 'SVProgressHUD/PrivacyInfo.xcprivacy']
    ext.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'SV_APP_EXTENSIONS=1' }
  end
end

#
# Be sure to run `pod lib lint BWKit_swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'BWKit_swift'
    s.version          = '0.1.2'
    s.summary          = 'A short description of BWKit_swift.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/FWBGitHub/BWKit_swift'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'FWBGitHub' => '767830854@qq.com' }
    s.source           = { :git => 'https://e.coding.net/yt_ios/BWKit/BWkit_swift.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '9.0'
    
    s.source_files = 'BWKit_swift/Classes/**/*'
    s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

    # s.resource_bundles = {
    #   'BWKit_swift' => ['BWKit_swift/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'SnapKit'
    s.dependency 'RTRootNavigationController'
    s.dependency 'YYKit'
    s.dependency 'RxSwift'
    s.dependency 'RxCocoa'
    s.dependency 'IQKeyboardManagerSwift'
    s.dependency 'SwiftyUserDefaults'
    s.dependency 'SwiftyRSA'
end

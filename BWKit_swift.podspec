#
# Be sure to run `pod lib lint BWKit_swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#pod spec lint --allow-warnings
#pod trunk push --allow-warnings --verbose
 #
#

Pod::Spec.new do |s|
    s.name             = 'BWKit_swift'
    s.version          = '0.2.0'
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
    
    s.ios.deployment_target = '11.0'
    s.source_files = 'BWKit_swift/Classes/*'
    s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64'  }
    s.source_files = 'BWKit_swift/Classes/**/*'
    s.swift_versions = '4.0'


#    s.subspec 'Extensions' do |ss|
#        ss.source_files = 'BWKit_swift/Classes/Extensions/**/*'
#        ss.dependency 'BWKit_swift/Const'
#    end
#    s.subspec 'Const' do |ss|
#        ss.source_files = 'BWKit_swift/Classes/Const/**/*'
#        ss.dependency 'BWKit_swift/Extensions'
#    end
#    s.subspec 'Custom' do |ss|
#        ss.source_files = 'BWKit_swift/Classes/Custom/**/*'
#        ss.dependency 'BWKit_swift/Extensions'
#        ss.dependency 'BWKit_swift/Const'
#    end


    
end

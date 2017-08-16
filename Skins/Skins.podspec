#
# Be sure to run `pod lib lint Skins.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Skins'
  s.version          = '0.1.0'
  s.summary          = 'A library containing all the Skins.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Contains all the Skins that can be applied to an app.
                       DESC

  s.homepage         = 'https://github.com/nap-sam-dean/Skins'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nap-sam-dean' => 'sam.dean@net-a-porter.com' }
  s.source           = { :git => 'https://github.com/nap-sam-dean/Skins.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.platform = :ios
  s.module_name = 'Skin'

  s.subspec 'Core' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'Skins/Core/**/*'
    ss.frameworks = 'UIKit'
  end

  s.subspec 'Skin1' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.dependency 'Skins/Core'
    ss.source_files = 'Skins/Skin1/Classes/**/*'
    ss.resource_bundles = {
        'Fonts' => 'Skins/Skin1/Assets/Fonts/*',
        'Assets' => 'Skins/Skin1/Assets/Assets/*'
    }
  end

  s.subspec 'Skin2' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.dependency 'Skins/Core'
    ss.source_files = 'Skins/Skin2/Classes/**/*'
  end
end

#
# Be sure to run `pod lib lint INSSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'INSSwift'
  s.version          = '0.1.0'
  s.summary          = 'A short description of INSSwift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/INSSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dylan' => '3664132@163.com' }
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/INSSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'INSSwift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'INSSwift' => ['INSSwift/Assets/*.png']
  # }

  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'LKDBHelper'
  s.dependency 'YYModel'
  s.dependency 'Moya', "8.0.0-beta.2"
  s.dependency 'PermissionScope'
  s.dependency 'AsyncDisplayKit'
  s.dependency 'KeychainAccess'
end

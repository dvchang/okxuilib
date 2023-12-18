#
# Be sure to run `pod lib lint OKXUIlib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OKXUIlib'
  s.version          = '0.1.0'
  s.summary          = 'OKXUIlib can display video and image carousel in a home feed.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  OKXUIlib can display video and image carousel in a home feed. Video on the top and image carousel at the bottom.
                       DESC

  s.homepage         = 'https://github.com/dvchang/OKXUIlib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dvchang' => 'dvchangyuan@gmail.com' }
  s.source           = { :git => 'https://github.com/dvchang/OKXUIlib.git', :tag => 'v0.1.0' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'OKXUIlib/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OKXUIlib' => ['OKXUIlib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AlamofireImage', '~> 4.3'
end

#
# Be sure to run `pod lib lint FomaViewableSound.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FomaViewableSound'
  s.version          = '1.0.3'
  s.summary          = '이것은 소리를 풍경으로 표현한 라이브러리입니다!'
  s.homepage         = 'https://github.com/fomagran/FomaViewableSound'
  s.swift_versions = '5.0'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fomagran' => 'fomagran6@naver.com' }
  s.source           = { :git => 'https://github.com/fomagran/FomaViewableSound.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.source_files = 'FomaViewableSound/Classes/**/*'
    s.resource_bundles = {
      'FomaViewableSound' => ['FomaViewableSound/Resources/**/*.{storyboard,xcassets}']
   }
  
  end

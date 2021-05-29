#
# Be sure to run `pod lib lint FomaViewableSound.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FomaViewableSound'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FomaViewableSound.'
  s.homepage         = 'https://github.com/fomagran/FomaViewableSound'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fomagran' => 'fomagran6@naver.com' }
  s.source           = { :git => 'https://github.com/fomagran/FomaViewableSound.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = 'FomaViewableSound/Classes/**/*'
  
end

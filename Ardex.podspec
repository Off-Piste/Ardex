#
# Be sure to run `pod lib lint Ardex.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Ardex'
  s.version          = '1.0.0-beta1'
  s.summary          = 'A very very very short description of Ardex.'
  
  s.description      = <<-DESC
TODO: Add very very very very very long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Off-Piste/Ardex'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'harrytwright' => 'haroldtomwright@gmail.com' }
  s.source           = { :git => 'https://github.com/Off-Piste/Ardex.git', :tag => '1.0.0-beta1' }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Ardex/**/*.{h,hpp,m,mm,swift}'
  s.public_header_files = [
  'Ardex/ADXDatasource.h',
  'Ardex/ADXListView.h',
  'Ardex/Common/*.h'
  ]
  
end

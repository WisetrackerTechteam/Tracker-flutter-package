#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint wisetracker.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'wisetracker'
  s.version          = '0.0.1'
  s.summary          = 'Wisetracker sdk flutter plugin.'
  s.description      = <<-DESC
Wisetracker sdk flutter plugin.
                       DESC
  s.homepage         = 'http://www.wisetracker.co.kr'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Wisetracker' => 'tech@wisetracker.co.kr' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'WiseTracker'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end

#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint wisetracker.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'wisetracker'
  s.version          = '0.0.5'
  s.summary          = 'wisetracker SDK flutter plugin'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/WisetrackerTechteam/Tracker-flutter-package'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Wisetracker' => 'tech@wisetracker.co.kr' }
  s.source           = { :git =>  "https://github.com/WisetrackerTechteam/Tracker-flutter-package.git", :tag => 's.version.to_s' }

  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.static_framework = true

  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.ios.dependency 'WiseTracker' 

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  # s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end

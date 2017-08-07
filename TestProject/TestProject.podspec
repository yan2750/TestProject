#
#  Be sure to run `pod spec lint TestProject.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "TestProject"
  s.version      = "0.0.1"
  s.summary      = "TestProject for ios."
  s.homepage     = "https://github.com/yan2750/TestProject.git"
  s.license      = "MIT"
  s.author             = { "yan2750" => "275073520@qq.com" }
  s.source       = { :git => "https://github.com/yan2750/TestProject.git", :tag => "0.0.1"}
  s.source_files  = "TestProject/TestProject/Classes/**/*.{h,m}"
  s.dependency 'SSKeychain', '~> 1.3.1'

end

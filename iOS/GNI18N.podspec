#
# Be sure to run `pod lib lint GNI18N.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = "GNI18N"
  s.version = "0.1.0"
  s.summary = "A I18N framework for iOS hybird app."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description = <<-DESC
  A I18N framework for iOS hybird app.                     
  DESC

  s.homepage = "https://github.com/KefeiQian/hybrid-mobile-app-i18n-framework"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Kefei Qian" => "kefei.qian@hotmail.com" }
  s.source = { :git => "https://github.com/Jozdortraz/GNI18N.git", :tag => s.version.to_s }

  s.ios.deployment_target = "13.0"

  s.source_files = "GNI18N/Classes/**/*"

  s.frameworks = "SwiftUI", "WebKit"
  s.dependency "WKWebViewJavascriptBridge", "~> 1.2"
  s.dependency "SwiftyUserDefaults", "~> 5.0"
end

require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-sumsubstance"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-sumsubstance
                   DESC
  s.homepage     = "https://github.com/github_account/react-native-sumsubstance"
  s.license      = "MIT"
   s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Your Name" => "trickyc0d3r@gmail.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/github_account/react-native-sumsubstance.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  s.dependency 'SumSubstanceKYC'
  s.dependency 'SumSubstance/Specs'
  s.dependency 'CocoaPods/Specs'
end

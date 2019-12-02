require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-sumsubstance"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-sumsubstance
                   DESC
  s.homepage     = "https://github.com/trickyc0d3r/react-native-sumsubstance"
  s.license      = "MIT"
   s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Your Name" => "trickyc0d3r@gmail.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/trickyc0d3r/react-native-sumsubstance.git", :tag => "#{s.version}" }
  s.source =  'https://github.com/CocoaPods/Specs.git'
  s.source = 'https://github.com/SumSubstance/Specs.git'

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  s.dependency 'SumSubstanceKYC'
end


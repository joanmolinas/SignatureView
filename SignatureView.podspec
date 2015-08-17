Pod::Spec.new do |s|

s.platform = :ios, '8.0'
s.ios.deployment_target = '8.0'
s.name = "SignatureView"
s.summary = "Siganture View is an view for signs in your app"
s.requires_arc = true

s.version = "1.0"
s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Joan Molinas" => "joanmramon@gmail.com" }
s.homepage = "https://github.com/ulidev/SignatureView"
s.source = { :git => "https://github.com/ulidev/SignatureView.git", :tag => s.version.to_s }
s.framework = "UIKit"
s.source_files = "FreehandDrawingView/*.{h,m}"
end
Pod::Spec.new do |s|
s.name         = "SwiftlyScrollSlider"
s.version      = "0.4.1"
s.summary      = "Swiftly Scroll Slider"
s.description  = "Swiftly Scroll Slider - a custom slider to UIScrollView"
s.homepage     = "https://github.com/maximbilan/SwiftlyScrollSlider"
s.license      = { :type => "MIT" }
s.author       = { "Maxim Bilan" => "maximb.mail@gmail.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/maximbilan/SwiftlyScrollSlider.git", :tag => s.version.to_s }
s.source_files = "Classes", "SwiftlyScrollSlider/Sources/**/*.{swift}"
s.resources	   = "SwiftlyScrollSlider/Assets/*.*"
s.requires_arc = true
end

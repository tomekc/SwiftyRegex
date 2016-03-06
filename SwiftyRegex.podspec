Pod::Spec.new do |s|
  s.name             = "SwiftyRegex"
  s.version          = "1.0.0"
  s.summary          = "Tiny Swift wrapper around NSRegularExpression for usable API."
  s.homepage         = "https://github.com/tomekc/SwiftyRegex"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Tomek Cejner" => "tomek@japko.info" }
  s.source           = { :git => "https://github.com/tomekc/SwiftyRegex.git",
                         :tag => s.version.to_s }
  s.source_files     = "Sources/*.swift"
  s.requires_arc     = true

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
end
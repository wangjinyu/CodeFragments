Pod::Spec.new do |s|

s.name             = "CodeFragments"

s.version          = "3.0.0"

s.summary          = "iOS各种扩展"

s.description      = <<-DESC
 "1.用 Photos 框架替代原来的 AssetsLibrary库"
DESC

s.homepage         = "https://github.com/wangjinyu/CodeFragments"
s.license          = 'MIT'
s.author           = { "王金宇" => "jinyuid@gmail.com" }

s.source           = { :git => "https://github.com/wangjinyu/CodeFragments.git", :tag => s.version.to_s }
s.platform     = :ios, '8.0'

s.requires_arc = true

s.source_files = 'CodeFragments/*'

s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'SystemConfiguration', 'Accelerate', 'Photos', 'PhotosUI'

end
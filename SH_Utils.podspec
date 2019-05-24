Pod::Spec.new do |s|
s.name = 'SH_Utils'
s.version = '0.0.0.3'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'nothings'
s.homepage = 'https://github.com/wshcocoapods'
s.authors = { 'wsh' => '389889154@qq.com' }
s.source = { :git => 'https://github.com/wshcocoapods/UIKit.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'SH_Utils/Utils/'
s.frameworks = 'UIKit'

# 依赖
s.dependency 'MJExtension'
s.dependency 'SDWebImage'
s.dependency 'Masonry'
s.dependency 'MJRefresh'
end

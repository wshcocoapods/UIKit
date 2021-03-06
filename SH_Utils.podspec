Pod::Spec.new do |s|
s.name = 'SH_Utils'
s.version = '0.0.0.5'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'nothings'
s.homepage = 'https://github.com/wshcocoapods'
s.authors = { 'wsh' => '389889154@qq.com' }
s.source = { :git => 'https://github.com/wshcocoapods/UIKit.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
#s.source_files = 'SH_Utils/Utils/**/*.{h,m}'

s.frameworks = 'UIKit'

# 依赖
s.dependency 'MJExtension'
s.dependency 'SDWebImage'
s.dependency 'Masonry'
s.dependency 'MJRefresh'


#source
s.source_files = 'SH_Utils/Utils/*.h'

s.default_subspec = 'Category','Controller','View','Utils','Manager'
s.subspec 'Category' do |cg|
cg.source_files = 'SH_Utils/Utils/Category/*.{h,m}'
end
s.subspec 'Controller' do |co|
co.source_files = 'SH_Utils/Utils/Controller/*.{h,m}'
end
s.subspec 'View' do |v|
v.source_files = 'SH_Utils/Utils/View/*.{h,m}'
end
s.subspec 'Utils' do |ut|
ut.source_files = 'SH_Utils/Utils/Utils/*.{h,m}'
end
s.subspec 'Manager' do |ut|
ut.source_files = 'SH_Utils/Utils/Manager/*.{h,m}'
end
end

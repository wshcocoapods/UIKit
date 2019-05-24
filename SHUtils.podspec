Pod::Spec.new do |s|
s.name = 'SH_Utils'
s.version = '0.0.0.3'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = ''
s.homepage = 'https://github.com/CodeWicky/DWReader'
s.authors = { 'codeWicky' => 'codewicky@163.com' }
s.source = { :git => '', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = '/SH_Utils/Utils/*'
s.frameworks = 'UIKit'
end
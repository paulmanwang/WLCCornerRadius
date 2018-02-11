Pod::Spec.new do |s|
    s.name         = 'WLCCornerRadius'
    s.version      = '1.0'
    s.summary      = 'A very simple but high performance way to set corner for UIImageView'
    s.homepage     = 'https://github.com/wanglichun'
    s.license      = 'MIT'
    s.authors      = {'wanglichun' => 'wlccqu@126.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/wanglichun/WLCCornerRadius', :tag => '1.0'}
    s.source_files = 'UIImageView+WLCCornerRadius/*.{h,m}'
    s.requires_arc = true
    s.frameworks = 'UIKit'
end

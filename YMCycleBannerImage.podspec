Pod::Spec.new do |s|
    s.name         = 'YMCycleBannerImage'
    s.version      = '1.1.1'
    s.summary      = 'An easy way to use pull-to-YMCycleBannerImage'
    s.homepage     = 'https://github.com/iosdeveloperSVIP/YMCycleBannerImage'
    s.license      = 'MIT'
    s.authors      = {'yimin' => 'iosdeveloper@vip.163.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://raw.githubusercontent.com/iosdeveloperSVIP/YMCycleBannerImage/master/ymbanner.gif', :tag => s.version}
    s.source_files = 'YMCycleBannerImage/YMCycleBannerImage/*.{h,m}'
    s.resource     = 'YMCycleBannerImage/YMCycleBannerImage/YMCycleBannerImage.bundle'
    s.requires_arc = true
end

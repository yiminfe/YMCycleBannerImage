Pod::Spec.new do |s|
    s.name         = 'YMCycleBannerImage'
    s.version      = '1.0.1'
    s.summary      = 'One line of code with infinite shuffling'
    s.homepage     = 'https://github.com/iosdeveloperSVIP/YMCycleBannerImage'
    s.license      = 'MIT'
    s.authors      = {'zhaoyimin' => 'iosdeveloper@vip.163.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/iosdeveloperSVIP/YMCycleBannerImage.git', :tag => s.version}
    s.source_files = 'YMCycleBannerImage/*.{h,m}'
    s.resource     = 'YMCycleBannerImage/YMCycleBannerImage.bundle'
    s.requires_arc = true
end

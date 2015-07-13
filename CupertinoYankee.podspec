Pod::Spec.new do |s|
  s.name     = 'CupertinoYankee'
  s.version  = '1.1.0'
  s.license  = 'MIT'
  s.summary  = 'An NSDate Category With Locale-Aware Calculations for Beginning, End, Next & Previous of Day, Week, Month, and Year'
  s.homepage = 'https://github.com/mattt/CupertinoYankee'
  s.social_media_url = 'https://twitter.com/mattt'
  s.authors  = {'Mattt Thompson' => 'm@mattt.me'}
  s.source   = { :git => 'https://github.com/mattt/CupertinoYankee.git', :tag => s.version.to_s }
  s.source_files = 'CupertinoYankee/NSDate+CupertinoYankee.{h,m}'
  s.requires_arc = true
end

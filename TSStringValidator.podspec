Pod::Spec.new do |s|

  s.name         = "TSStringValidator"
  s.version      = "1.0.0"
  s.summary      = "TSStringValidator - Valid your strings in the simpliest way."

  s.homepage     = "http://github.com/tomkowz/TSStringValidator"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "Tomasz Szulc" => "szulctomasz@me.com" }
  s.social_media_url = "http://twitter.com/tomkowz"

  s.source       = { :git => "https://github.com/tomkowz/TSStringValidator.git", :commit => "084f47bc9883431322b4b9ad4e25f4b085093d49" }

  s.source_files  = 'Classes', 'Classes/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'

end

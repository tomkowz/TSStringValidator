Pod::Spec.new do |s|
  s.name         = "TSStringValidator"
  s.version      = "1.0.0"
  s.summary      = "TSStringValidator - Valid your strings in the simpliest way."
  s.description  = <<-DESC
  				   Couple of classes which allows you to simply validate strings in the project.
                   DESC
  s.homepage     = "http://github.com/tomkowz/TSStringValidator"
  s.license      = 'MIT'
  s.author       = { "Tomasz Szulc" => "szulctomasz@me.com" }
  s.source       = { :git => "https://github.com/tomkowz/TSStringValidator.git", :tag => '1.0.0' }

  s.requires_arc = true
  
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  
  s.source_files = 'Classes'
  
end
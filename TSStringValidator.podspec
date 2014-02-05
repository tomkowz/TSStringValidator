Pod::Spec.new do |s|
  s.name         = "TSStringValidator"
  s.version      = "1.0.0"
  s.summary      = "TSStringValidator - Valid your strings in the simpliest way."
  s.description  = <<-DESC
  				   Couple of classes which allows you to simply validate strings in the project.
                   DESC
  s.homepage     = "http://github.com/tomkowz/TSStringValidator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Tomasz Szulc" => "szulctomasz@me.com" }
  s.source       = { :git => "https://github.com/tomkowz/TSStringValidator.git", :commit => "e02f9b33922f828795ff2ef0256a2ec8f808fbfb" }
  s.source_files = "Classes/TSStringValidator.{h.m}"

  s.requires_arc = true
  
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  
  
end
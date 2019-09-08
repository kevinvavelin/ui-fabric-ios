Pod::Spec.new do |s|
  s.name         = "OfficeUIFabric"
  s.version      = "0.2.17"
  s.summary      = "Office UI Fabric is a set of reusable UI controls and tools"
  s.homepage     = "https://onedrive.visualstudio.com/Design/The%20Studio/_git/fabric-ios"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Microsoft" => "vladf@microsoft.com" }

  s.platform     = :ios
  s.ios.deployment_target = "11.0"
  s.swift_version = "5.0"

  s.source       = { :git => "https://onedrive.visualstudio.com/Design/The%20Studio/_git/fabric-ios", :tag => "#{s.version}" }
  s.source_files = "OfficeUIFabric/**/*.{swift,h}"
  s.resource_bundle = { 'OfficeUIFabricResources' => "OfficeUIFabric/**/*.{storyboard,xib,xcassets,strings,stringsdict}" }
end

Pod::Spec.new do |s|
  s.name             = 'SimplePDFViewer'
  s.version          = '0.1.0'
  s.summary          = 'Display & share PDF documents easily in iOS.'
  s.description      = <<-DESC
                        SimplePDFViewer is a UIViewController that displays a PDF document along with some basic PDF functionality such as zoom, export, and jump to page. Create the view controller using a PDFDocument, URL, or raw Data. Basic customization is available.
                       DESC
  s.homepage         = 'https://github.com/frankfka/SimplePDFViewer'
  s.swift_versions   = ['4.0', '4.2', '5.0']
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Frank Jia' => 'jiafrank98@gmail.com' }
  s.source           = { :git => 'https://github.com/frankfka/SimplePDFViewer.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'SimplePDFViewer/Classes/**/*'
  s.frameworks = 'UIKit', 'PDFKit'
  s.dependency 'SnapKit', '~> 5.0.0'
end

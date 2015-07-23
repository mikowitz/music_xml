# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'music_xml/version'

Gem::Specification.new do |spec|
  spec.name          = "music_xml"
  spec.version       = MusicXml::VERSION
  spec.authors       = ["Michael Berkowitz"]
  spec.email         = ["michael.berkowitz@gmail.com"]
  spec.summary       = %q{DSL for creating scores in musicXML format}
  spec.description   = %q{DSL for creating scores in musicXML format}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

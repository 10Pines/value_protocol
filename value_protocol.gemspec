# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'value_protocol/version'

Gem::Specification.new do |spec|
  spec.name          = 'value_protocol'
  spec.version       = ValueProtocol::VERSION
  spec.authors       = ['Nicolas Papagna Maldonado']
  spec.email         = ['nicolas.papagna@10pines.com']
  spec.summary       = %q{Makes all objects polymorphic with respect to the :call message, allowing to use any objects where a block is expected.}
  spec.description   = %q{Makes all objects polymorphic with respect to the :call message, allowing to use any objects where a block is expected.}
  spec.homepage      = 'https://github.com/10Pines/value_protocol.git'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end

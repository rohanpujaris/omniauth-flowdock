# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/flowdock/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-flowdock"
  spec.version       = Omniauth::Flowdock::VERSION
  spec.authors       = ["Ville Lautanala"]
  spec.email         = ["lautis@gmail.com"]
  spec.summary       = %q{Flowdock OAuth 2.0 Strategy for OmniAuth}
  spec.description   = %q{Flowdock OAuth 2.0 Strategy for OmniAuth}
  spec.homepage      = "https://github.com/flowdock/omniauth-flowdock"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth-oauth2", "~> 1.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "webmock", "~> 1.16"
end

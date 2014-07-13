# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitch_api/version'

Gem::Specification.new do |spec|
  spec.name          = "twitch_api"
  spec.version       = TwitchApi::VERSION
  spec.authors       = ["hellaxe"]
  spec.email         = ["helaxe@gmail.com"]
  spec.description   = %q{Twitch api wrapper for ruby}
  spec.summary       = %q{Twitch api wrapper for ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "curb"
  spec.add_dependency "json"
  spec.add_development_dependency 'psych'
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

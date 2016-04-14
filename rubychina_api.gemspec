# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubychina_api/version'

Gem::Specification.new do |spec|
  spec.name = "rubychina_api"
  spec.version = RubychinaApi::VERSION
  spec.authors = ["adamshen"]
  spec.email = ["adam_ruby@126.com"]
  spec.summary = %q{Simple wrapper for the RubyChina API}
  spec.description = %q{Simple wrapper for the RubyChina API}
  spec.homepage = "https://github.com/adamshen/rubychina_api"
  spec.license = "MIT"
  spec.files = %w(LICENSE.txt README.md Rakefile rubychina_api.gemspec)
  spec.files += Dir["lib/**/*"]

  spec.add_dependency "faraday"
  spec.add_dependency "json"
  spec.add_dependency "oauth2"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end

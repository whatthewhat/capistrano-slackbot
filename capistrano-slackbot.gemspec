# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/slackbot/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-slackbot"
  spec.version       = Capistrano::Slackbot::VERSION
  spec.authors       = ["Mikhail Topolskiy"]
  spec.email         = ["mikhail.topolskiy@gmail.com"]
  spec.summary       = %q{Slack integration for Capistrano 3}
  spec.description   = %q{Send capistrano deployment notificatons to https://slack.com/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", ">= 3.0"
  spec.add_dependency "faraday"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0.beta2"
  spec.add_development_dependency "webmock", "~> 1.17.4"
end

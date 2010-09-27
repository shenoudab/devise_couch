# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'devise_couch/version'
 
Gem::Specification.new do |s|
  s.name    = "devise_couch"
  s.summary = "CouchDB integration for Devise framework"
  s.description = "CouchDB integration for Devise authentication framework"
  s.version = DeviseCouch::VERSION
  s.email = "sbertel@mobithought.com"
  s.homepage = "http://github.com/shenoudab/devise_couch"
  s.author = 'Shenouda Bertel'
  s.files        = Dir.glob("{lib,test}/**/*") + %w(MIT-LICENSE README.markdown Gemfile Rakefile devise_couch.gemspec)
  s.require_path = 'lib'
end

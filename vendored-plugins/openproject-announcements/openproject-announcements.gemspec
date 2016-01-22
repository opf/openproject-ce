# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'open_project/announcements/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-announcements"
  s.version     = OpenProject::Announcements::VERSION
  s.authors     = "OpenProject GmbH"
  s.email       = "info@openproject.com"
  s.homepage    = "https://community.openproject.org/projects/announcement/"
  s.summary     = 'OpenProject Plugin for showing announcements on the login page'
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + %w(CHANGELOG.md README.md)

  s.add_dependency 'rails', '~> 4.2.4'


  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'cucumber-rails'
  s.add_development_dependency 'database_cleaner'
end

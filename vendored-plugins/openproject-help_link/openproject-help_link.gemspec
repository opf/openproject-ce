$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'open_project/help_link/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'openproject-help_link'
  s.version     = OpenProject::HelpLink::VERSION
  s.authors     = 'OpenProject GmbH'
  s.email       = 'info@openproject.com'
  s.homepage    = 'https://community.openproject.org/projects/help-link-changer'
  s.summary     = 'OpenProject Help Link'
  s.description = "This plugin allows you to change the target of the help link
                   in your OpenProject. Doing so allows you to e.g. have a
                   support project within your OpenProject."

  s.files = Dir['{app,config,db,lib, doc}/**/*'] + ['README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.4'
end

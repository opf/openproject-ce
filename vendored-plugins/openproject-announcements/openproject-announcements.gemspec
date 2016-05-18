# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-announcements"
  s.version     = '5.1.0'
  s.authors     = "OpenProject GmbH"
  s.email       = "info@openproject.com"
  s.summary     = 'OpenProject Plugin for showing announcements on the login page'
  s.description = s.summary

  s.post_install_message = <<-MESSAGE
    OpenProject-announcements has been fully integrated into OpenProject 5.1.
    Please remove this plugin from your Gemfile.plugin entries.
  MESSAGE
end

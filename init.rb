require 'redmine'
require 'redmine_skype_link'

Redmine::Plugin.register :redmine_skype_link do
  name 'Redmine Skype Link Plugin'
  author 'Undev'
  description 'This plugin allows using Skype URIs in Redmine.'
  version '1.0.0'
  url 'https://github.com/Undev/redmine_skype_link'
  author_url 'http://github.com/Undev'
  requires_redmine :version_or_higher => '2.1'
end

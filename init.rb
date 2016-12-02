require 'redmine'

Redmine::Plugin.register :redmine_skype_link do
  name 'Redmine Skype Link Plugin'
  author 'Restream'
  description 'This plugin allows using Skype URIs in Redmine.'
  version '1.1.0'
  url 'https://github.com/Restream/redmine_skype_link'
  author_url 'http://github.com/Restream'
end

require 'redmine_skype_link'

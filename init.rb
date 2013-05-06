require 'redmine'
require 'redmine_skype_link'

Redmine::Plugin.register :redmine_skype_link do
  name 'Redmine Skype Link plugin'
  author 'danil.tashkinov@gmail.com'
  description 'Add skype links to redmine wiki formatting'
  version '0.0.1'
  url 'https://github.com/Undev/redmine_skype_link'
  author_url 'http://github.com/Undev'
  requires_redmine :version_or_higher => '2.1'
end

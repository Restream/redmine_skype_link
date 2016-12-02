require_dependency 'redmine_skype_link/patcher'
require_dependency 'redmine_skype_link/textile_patch'
require_dependency 'redmine_skype_link/redmine_helpers_url_patch'

ActionDispatch::Callbacks.to_prepare do

  RedmineSkypeLink::Patcher.apply RedmineSkypeLink::TextilePatch, RedCloth3

  RedmineSkypeLink::Patcher.apply RedmineSkypeLink::RedmineHelpersURLPatch,
    Redmine::Helpers::URL,
    ApplicationController,
    RedCloth3,
    Redmine::FieldFormat::Base

  if defined?(Redmine::WikiFormatting::Markdown::HTML)
    RedmineSkypeLink::Patcher.apply RedmineSkypeLink::RedmineHelpersURLPatch, Redmine::WikiFormatting::Markdown::HTML
  end

end

require 'redmine'

# Patches to the Redmine core.
#require 'dispatcher'

#Dispatcher.to_prepare :redmine_redirect_home do
ActionDispatch::Callbacks.to_prepare do
  require_dependency 'welcome_controller'
  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  unless WelcomeController.included_modules.include? RedmineRedirectHome::WelcomeControllerPatch
    WelcomeController.send(:include, RedmineRedirectHome::WelcomeControllerPatch)
  end
end

Redmine::Plugin.register :redmine_redirect_home do
  name 'Redmine Redirect Home plugin'
  author 'Håkon Lerring'
  description 'Plugin for    starte redmine annet sted enn home'
  version '0.0.1'
  url 'http://github.com/Hakon/redmine_redirect_home'
  author_url 'http://github.com/Hakon'
end
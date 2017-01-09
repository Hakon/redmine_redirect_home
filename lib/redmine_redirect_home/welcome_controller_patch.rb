module RedmineRedirectHome
  module WelcomeControllerPatch
    def self.included(base) # :nodoc:
      base.extend(ClassMethods)

      base.send(:include, InstanceMethods)

      # Same as typing in the class
      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development
        before_filter :redirect_to_wiki
      end

    end

    module ClassMethods
    end

    module InstanceMethods
      def redirect_to_wiki
        redirect_to project_wiki_path(project_id: 'admin')
      end
    end
  end
end
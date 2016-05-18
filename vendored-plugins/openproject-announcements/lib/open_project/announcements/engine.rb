module OpenProject::Announcements
  class Engine < ::Rails::Engine
    engine_name :openproject_announcements

    config.autoload_paths += Dir["#{config.root}/lib/"]

    spec = Bundler.environment.specs['openproject-announcements'][0]
    initializer 'announcements.register_plugin' do
      Redmine::Plugin.register :openproject_announcements do
        name 'OpenProject Announcements'
        author ((spec.authors.kind_of? Array) ? spec.authors[0] : spec.authors)
        author_url spec.homepage
        description spec.description
        version spec.version
        url 'https://www.openproject.org/projects/announcement'

        requires_openproject ">= 4.0.0"

        menu :admin_menu,
             :announcements,
             {:controller => 'announcements', :action => 'edit'},
             :caption => 'Announcement',
             :html => {:class => 'icon2 icon-news'}
      end
    end

    initializer 'announcements.precompile_assets' do
      Rails.application.config.assets.precompile += %w(announcements/announcements.css)
    end

    # adds our factories to factory girl's load path
    initializer "announcements.register_factories", :after => "factory_girl.set_factory_paths" do |app|
      if defined?(FactoryGirl)
        FactoryGirl.definition_file_paths << File.expand_path(self.root.to_s + '/spec/factories')
      end
    end

    initializer 'announcements.register_test_paths' do |app|
      app.config.plugins_to_test_paths << self.root
    end

    initializer 'announcements.append_migrations' do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    config.before_configuration do |app|
      # This is required for the routes to be loaded first
      # as the routes should be prepended so they take precedence over the core.
      app.config.paths['config/routes.rb'].unshift File.join(File.dirname(__FILE__),
                                                          "..", "..", "..", "config", "routes.rb")
    end

    initializer "announcements.remove_duplicate_routes", :after => "add_routing_paths" do |app|
      # removes duplicate entry from app.routes_reloader
      # As we prepend the plugin's routes to the load_path up front and rails
      # adds all engines' config/routes.rb later, we have double loaded the routes
      # This is not harmful as such but leads to duplicate routes which decreases performance
      app.routes_reloader.paths.uniq!
    end

    config.to_prepare do
      require_dependency 'open_project/announcements/hooks'
    end
  end
end

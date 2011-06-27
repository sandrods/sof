require 'refinery'

module Refinery
  module Editais
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "editais"
          plugin.activity = {
            :class => Edital,
            :title => 'titulo'
          }
        end
      end
    end
  end
end

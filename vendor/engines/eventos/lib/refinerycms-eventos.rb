require 'refinery'

module Refinery
  module Eventos
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "eventos"
          plugin.activity = {
            :class => Evento,
            :title => 'titulo'
          }
        end
      end
    end
  end
end

require 'refinery'

module Refinery
  module Publicacoes

    class Engine < Rails::Engine
      initializer 'publicacoes serves assets' do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_publicacoes"
          plugin.url = {:controller => '/admin/artigos', :action => 'index'}
          plugin.menu_match = /(admin|refinery)\/(artigos|categorias)$/
          plugin.activity = {
            :class => Artigo
          }
        end

      end
    end if defined?(Rails::Engine)

    class << self
      def version
        %q{1.0}
      end
    end
  end
end

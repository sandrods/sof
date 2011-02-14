if defined?(Bundler) and !defined?(FiltersSpam)
  # this will tell the user what to do
  load(File.expand_path('../../Gemfile', __FILE__))
end

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
          plugin.menu_match = /^\/?(admin|refinery)\/?(artigos|categorias)?/
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

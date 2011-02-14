require File.expand_path('../../lib/refinerycms-publicacoes', __FILE__)

Refinery::Plugin.register do |plugin|
  plugin.name = "refinerycms_publicacoes"
  plugin.url = {:controller => '/admin/publicacoes/artigos', :action => 'index'}
  plugin.menu_match = /^\/?(admin|refinery)\/publicacoes\/?(artigos|categorias)?/
  plugin.activity = {
    :class => Artigo
  }
end
